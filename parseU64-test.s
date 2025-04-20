.globl _start
_statt:
ldr x9,[x0,16]
mov x0,x9
bl szlen
mov x1,x0
mov x0,x9
bl parseU64

// x0 is Error x1 is u64
mov x9,x0
mov x10,x1
mov x0,2
mov x1,x1
mov x2,1
mov x8,64
svc

