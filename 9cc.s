.data
usageLen = usage__end - usageStr
usageStr: .ascii "Usage: 9cc EXPR\n"
usage__end:

.text
.globl _start
_start:
// argc argv+0 argv+1 ... on stack
ldr x0,[sp]

// argc
cmp x0,2
b.lt _usage

// x9 is argv+1 i.e. &argv[1]
ldr x9,[sp,16]
mov x0,x9
bl szlen
mov x10,x0 // szlen(argv[1])
mov x8,93
svc 0

// usage error
_usage:
mov x0,2
ldr x1,=usageStr
mov x2,usageLen
mov x8,64
svc 0
mov x0,1
mov x8,93
svc 0
