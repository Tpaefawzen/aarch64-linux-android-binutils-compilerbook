//! Print usage and exit 1
//! Noreturn
.data
usageLen = usage__end - usageStr
usageStr: .ascii "Usage: 9cc EXPR\n"
usage__end:

.text
.globl errorUsage
errorUsage:
mov x0,2
ldr x1,=usageStr
mov x2,usageLen
mov x8,64
svc 0
mov x0,1
mov x8,93
svc 0
