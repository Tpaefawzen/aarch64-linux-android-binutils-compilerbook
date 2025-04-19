/// x0 u8
/// return x0 u1 // 1 for truthy
.globl isDigit
isDigit:
and w0,w0,255
mov x1,xzr
cmp w0,48
cinc x1,x1,pl
cmp w0,58
cinc x1,x1,pl
and x0,x1,1
ret
