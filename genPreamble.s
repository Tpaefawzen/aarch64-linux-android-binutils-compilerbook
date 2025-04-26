.globl genPreamble
genPreamble:
mov x0,1
ldr x1,=.preamble
ldr x2,=.preamble.len
mov x8,64
svc 0
ret

.data
.preamble: .ascii ".globl _start\n_start:\nmov x0,"
.preamble.len = . - .preamble
