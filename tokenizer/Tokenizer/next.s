//! Eat a token. Obtain token kind, and where it occured.
//! Modify self to read char after that.

/// input x8: *@This()
/// output x0: [*]const u8
/// Output x1 = x0.len
/// Output x2: Token
/// Output x8: *@This()
.globl tokenizer.Tokenizer.next
tokenizer.Tokenizer.next:
bl tokenizer.Tokenizer.getSlice
//
// x0,x1 Slice
// x8 self
//
.L.readOneChar:
cbz x1,.L.Eof

ldrb w9,[x0],1
sub x1,x1,1
// obtw x0,x1 is consumed
// isSpace
cmp x9,9
b.eq .L.readOneChar
cmp x9,10
b.eq .L.readOneChar
cmp x9,32
b.eq .L.readOneChar

cmp x9,43
b.eq .L.Plus
cmp x9,45
b.eq .L.Minus

subs x10,x9,48
ccmp x10,10,0,ge
b.lt .L.Int

.L.Invalid:
// TODO: return actual .Invalid and its range
bl tokenizer.Tokenizer.setSlice
sub x0,x0,1
mov x1,1
mov x2,tokenizer.Token.Invalid
ret

.L.Plus:
// x0,x1 After Plus
bl tokenizer.Tokenizer.setSlice
sub x0,x0,1
mov x1,1
mov x2,tokenizer.Token.Plus
ret

.L.Minus:
// Ditto for .L.Plus
bl tokenizer.Tokenizer.setSlice
sub x0,x0,1
mov x1,1
mov x2,tokenizer.Token.Minus
ret

.L.Int:
// Remember beginning of token
sub x14,x0,1

// Parse [0-9]+(_+[0-9]+)*
// If [0-9]+(_+[0-9]+)*_+ then syntax error

cbz x1,.L.Int.Ok
ldrb w9,[x0],1
sub x1,x1,1
subs x10,x9,48
ccmp x10,10,0,ge
b.eq .L.Int

cmp x9,95
b.eq .L.Int.Underscore
// fallthrough

.L.Int.Ok:
// x0,x1 end of int
// x8.slice Origin
// x14 begin of slice to indicate Int
bl tokenizer.Tokenizer.setSlice
sub x1,x0,x14
mov x0,x14
mov x2,tokenizer.Token.Int
ret

.L.Int.Underscore:
cbz x1,.L.Int.Invalid
ldrb w9,[x0],1
sub x1,x1,1

subs x10,x9,48
ccmp x10,10,0,ge
b.lt .L.Int

cmp x9,95
b.eq .L.Int.Underscore
// fallthrough

.L.Int.Invalid:
bl tokenizer.Tokenizer.setSlice
sub x1,x0,x14
mov x0,x14
mov x2,tokenizer.Token.Invalid
ret

.L.Eof:
// No need to update self
// Nothing to do with current slice
mov x2,tokenizer.Token.Eof
ret
