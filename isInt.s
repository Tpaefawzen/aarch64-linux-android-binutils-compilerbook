//! Is Slice { x0: [*]const u8; x1 = x0.len } an unsigned integer in decimal?
//! It is not checked whether it fits in u8, u16, u32, or u64, or whatever

/// input x0: [*]const u8
/// input x1 = x0.len
/// Output x0: u1
///   1 as truthy
.globl isInt
isInt:
mov x9,0 // result

.L.loop:
cbz x1,.L.fin
sub x1,x1,1

ldrb w10,[x0,x1]
subs w10,w10,48
ccmp w10,10,0,pl
cset x9,mi
cbnz x9,.L.loop

.L.fin:
mov x0,x9
ret
