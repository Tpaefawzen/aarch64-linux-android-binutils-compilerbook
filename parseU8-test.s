.globl _start
_start:
ldr x0,[sp,16] // argv[1]
ldr x0,[x0] // argv[1][0]
mov x19,x0
bl szlen
mov x1,x0
mov x19,x0
bl parseU8
mov x8,93
svc 0
