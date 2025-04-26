.globl genPostamble
genPostamble:
mov x0,1
ldr x1,=.postamble
ldr x2,=.postamble.len
mov x8,64
svc
ret

.data
.postamble: .ascii "mov x8,93\nsvc 0\n"
.postamble.len = . - .postamble
