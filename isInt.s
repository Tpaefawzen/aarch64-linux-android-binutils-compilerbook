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
add x10,x10,1
cbz x1,.L.fin

ldr x11,[x0,x1]
ccmp x11,10,0,mi
cset x9,mi
cbnz x9,.L.loop

.L.fin:
mov x0,x9
ret
