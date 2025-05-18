//! Main of 9cc

.text
.globl _start
_start:
ldr x0,[sp]
cmp x0,2
b.lt errorUsage

ldr x0,[sp,16]
bl sz.toSlice
ldr x8,=.L.my_tokenizer
bl tokenizer.Tokenizer.newFromSlice
//
// x0: [*]const u8
// x1 = x0.len
// x8: Tokenizer
//
stp x0,x1,[sp,-16]!
str x8,[sp,-8]!
bl genPreamble
ldr x8,[sp],8
ldp x0,x1,[sp],16

bl tryExpectNumber
//
// x0: i64
// x8 Tokenizer
//
str x8,[sp,-8]!
bl gen.mov
ldr x8,[sp],8

.L.addOrSub:
bl atEof
//
// x0: u1 1 for truthy
cbnz x0,.L.finally
ldr x8,.L.my_tokenizer
bl consumePlus
//
//.
,n

.L.finally:
bl genPostamble

mov x0,0
mov x8,93
svc 0

.bss

.L.my_tokenizer:
.fill 16 // bytes
