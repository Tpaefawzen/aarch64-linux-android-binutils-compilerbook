//! Is [*:0]const u8 an unsigned integer in decimal?
//! It is not checked whether it fits in u8, u16, u32, or u64, or whatever

/// input x0: [*:0]const u8
/// Output x0: u1
///   1 as truthy
.globl isIntZ
isIntZ:
mov x9,0 // result

.L.loop:
ldr x10,[x0]
cbz x10,.L.fin

ccmp x10,10,0,mi
cset x9,mi
cbnz x9,.L.loop

.L.fin:
mov x0,x9
ret
