.globl _start
_start:
ldr x0,[sp,16] // argv+1
ldr x0,[x0] // (argv+1).*.*
bl parseDigit
mov x8,93
svc 0
