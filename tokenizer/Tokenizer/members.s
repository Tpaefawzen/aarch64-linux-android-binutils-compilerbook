//! getters and setters

.globl tokenizer.Tokenizer.getSlice
/// input x8: *Tokenizer
tokenizer.Tokenizer.getSlice:
/// Output x0, x1: [*]const u8, =x0.len
ldp x0,x1,[x8]
ret
