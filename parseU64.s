//! try to parse []const u8 as /^[0-9]+$/ as u64
.data

// Error
Ok = 0
InvalidChar = -1
Overflow = -2

.text
.globl parseU64

/// input x0 *[]const u8
/// input x1 x0.*.len
/// output x0 Error
/// output x1 u64 // may be corrupted
parseU64:
mov x2,InvalidChar // Error
mov x3,0 // u64 value
mov x4,x0 // remember *[]const u8
mov x5,x1 // remember x0.*.len

// Early reject
cbz x1,.L.Fin

1:
ldr x0,[x0]
bl isDigit
cbnz x0,3f

.L.Fin:
mov x0,x2
mov x1,x3
ret

3:
// x3 = x3*10+[x4]
ldr x0,[x4]
mul x3,x3,10
b.vc .L.Overflow
add x3,x3,x0
b.vc .L.Overflow
mov x2,Ok

// next character
add x4,x4,1
mov x0,x4
add x5,x1,-1
mov x1,x5
b 1b

.L.Overflow
mov x2,Overflow
ret
