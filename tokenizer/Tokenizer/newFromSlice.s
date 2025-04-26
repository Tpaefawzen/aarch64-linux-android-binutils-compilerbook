//! Create a Tokenizer from [*]const u8.

/// input x0: [*]const u8
/// input x1 = x0.len
/// input/Output x8: *Tokenizer
.globl tokenizer.Tokenizer.newFromSlice
tokenizer.Tokenizer.newFromSlice:
stp x0,x1,[x8]
ret
