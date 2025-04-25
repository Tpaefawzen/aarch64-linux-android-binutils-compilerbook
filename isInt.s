//! Is Slice { x0: [*]const u8; x1 = x0.len } an unsigned integer in decimal?
//! It is not checked whether it fits in u8, u16, u32, or u64, or whatever

/// Output x0: u1
///   1 as truthy
.globl isInt
isInt:
mov x9,0 // result

.L.loop:
sub x1,x1,1
b.mi .L.fin
ldr x10,[x0,x1]

sub x10,x10,48
b.mi .L.fail

cmp x10,10
b.ge .L.fail

mov x9,1
b .L.loop

.L.fail:
mov x9,0
.L.fin:
ret
