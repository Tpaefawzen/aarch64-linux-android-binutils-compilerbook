.text
.globl _start
_start:
ldr x0,[sp,16]
bl sz.len
mov x8,93
svc 0
