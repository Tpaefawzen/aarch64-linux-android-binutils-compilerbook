//! Tokenizer members and constructors

/// input x8: *Tokenizer
/// Output x0, x1: [*]const u8, =x0.len
.globl tokenizer.Tokenizer.getSlice
tokenizer.Tokenizer.getSlice:
ldp x0,x1,[x8]
ret

/// input x8: *@This()
//! Create a Tokenizer from [*]const u8.

/// input x0: [*]const u8
/// input x1 = x0.len
/// input/Output x8: *Tokenizer
///   Must point to where you want to be stored
.globl tokenizer.Tokenizer.newFromSlice

/// input x0,x1
/// Output x8 modified
.globl tokenizer.Tokenizer.setSlice

tokenizer.Tokenizer.setSlice:
tokenizer.Tokenizer.newFromSlice:
stp x0,x1,[x8]
ret
