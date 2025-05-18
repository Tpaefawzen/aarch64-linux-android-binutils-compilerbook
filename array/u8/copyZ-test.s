//! Usage: $0 STRING1 STRING2
.globl _start
_start:
ldp x0,x1,[sp,16]
bl szToSlice
stp x0,x1,[sp,-16]!
bl array.u8.copyZ
ldp x1,x2,[sp],16
mov x0,1
mov x8,64
svc 0

mov x8,93
svc 0
