.globl _start
_start:
ldr x0,[sp,16] // argv[1]
bl parseZU8
mov x8,93
svc 0
