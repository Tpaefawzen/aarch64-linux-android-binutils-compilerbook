//! returns input.len
.globl sz.len

/// input x0 [*:0]const u8
/// output x0 u64
sz.len:
mov x1,-1 // len
.L.loop:
add x1,x1,1
ldrb w2,[x0],1 // w2 = input.*; input += 1;
cbnz w2,.L.loop

mov x0,x1
ret
