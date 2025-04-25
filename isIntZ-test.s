.globl _start
_start:
ldr x0,[sp,16] // argv[1].?: [*:0]const u8
bl isIntZ
mov x8,93
svc 0
