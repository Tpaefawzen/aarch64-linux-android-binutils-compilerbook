//! @memcpy things for [*]u8

/// fn (x0: [*]u8, x1: [*]const u8, x2=x1.len) void
/// If x2 <= 0 then do nothing
.globl array.u8.copy
/// skip checking x2 <= 0
.globl array.u8.copyUnchecked

array.u8.copy:
tbnz x2,63,array.u8.copyUnchecked
ret

9:
ldrb w3,[x1],1
strb w3,[x0],1
sub x2,x2,1
array.u8.copyUnchecked:
cbnz x2,9b
ret
