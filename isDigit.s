//! '0'<=c and c<='9'
/// x0 u8
/// return x0 u1 // 1 for truthy
.globl isDigit
isDigit:
uxtb x0,w0
subs x0,x0,48
ccmp x0,10,0,pl
cset x0,lt
ret
