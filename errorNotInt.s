.globl errorNotInt
errorNotInt:
mov x0,2
ldr x1,=Msg
mov x2,Len
mov x8,64
svc 0

mov x0,1
mov x8,93
svc 0

.data
Len = MsgEnd - Msg
Msg: .ascii "Expected integer\n"
MsgEnd:
