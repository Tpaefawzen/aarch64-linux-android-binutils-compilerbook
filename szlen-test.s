.data
mystr: .asciz "hi"
.text
.globl _start
_start:
ldr x0,=mystr
bl szlen
mov x8,93
svc 0
