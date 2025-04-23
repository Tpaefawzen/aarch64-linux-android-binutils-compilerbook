//! like isDigit but x0 returns union(i8) { Ok: u4, Err: void, }

/// input x0 u8
/// Output x0 union{Ok:u4, Err:i8=-1, };
/// Parse x0 as digit. if digit, parse as integer.
.globl parseDigit
parseDigit:
and x0,x0,255
cmp x0,58
csetm x0,pl
subs x0,x0,48
csetm x0,mi
ret
