//! Parse x0: u8 as one-digit integer.
//! Return some negative value if error.

/// input x0 u8
/// Output x0 i64
/// '0' <= x0 ans x0 <= '9' then x0 - 48
/// Some negative value otherwise
.globl parseDigit
parseDigit:
uxtb x0,w0
sub x0,x0,48
cmp x0,10
cneg x0,x0,pl
ret
