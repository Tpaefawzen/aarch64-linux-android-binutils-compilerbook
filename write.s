//! just call such syscall

/// input w0: i32
///   fd
/// input x1: [*]const u8
/// input w2 = x1.len
///   Should >0 or something undefined
/// Output w0: i32
///   Number of bytes to be written as u31
///   or -1 when error
.globl write
write:
mov x8,64
svc 0
ret
