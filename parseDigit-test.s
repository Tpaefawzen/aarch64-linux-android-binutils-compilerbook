.globl _start
_start:
ldr x0,[sp,16] // argv+1
ldr x0,[x0] // (argv+1).*.*
mov x1,-1
bl parseDigit
cmp x0,0
csel x0,x0,x1,pl
mov x8,93
svc 0
