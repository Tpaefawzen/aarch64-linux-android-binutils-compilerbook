//! given x0: [*:0]const u8, get x1=x0.len while not modifying x0
.globl sz.toSlice

/// input x0 [*:0]const u8
/// output x0 [*:0]const u8
/// Output x1 = x0.len
sz.toSlice:
mov x1,-1 // len
.L.loop:
add x1,x1,1
ldrb w2,[x0,x1]
cbnz w2,.L.loop

ret
