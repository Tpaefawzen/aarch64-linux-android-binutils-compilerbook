.data
usageLen = usage__end - usageStr
usageStr: .ascii "Usage: 9cc EXPR\n"
usage__end:

.text
.globl _start
_start:
ldp x0,x1,[sp]

// argc
cmp x0,2
b.ge .L.usageOk

// usage error
_usage:
mov x0,2
ldr x1,=usageStr
ldr x2,=usageLen
mov x8,64
svc 0

mov x8,93
svc 0

.L.usageOk:
mov x0,xzr
mov x8,93
svc #0
