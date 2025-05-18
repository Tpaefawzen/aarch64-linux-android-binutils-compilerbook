//! @memcpy things for [*:0]u8

/// fn (x0: [*]u8, x1: [*:0]const u8) void
.globl array.u8.copyZ
/// Like copyZ but don't copy trailing zero
.globl array.u8.copyZWithoutZ

array.u8.copyZ:
ldrb w2,[x1],1
strb w2,[x0],1
cbnz w2,array.u8.copyZ
ret

9:
strb w2,[x0],1
array.u8.copyZWithoutZ:
ldrb w2,[x1],1
cbnz w2,9b
ret
