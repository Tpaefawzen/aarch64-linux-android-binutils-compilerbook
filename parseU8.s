//! Try to parse []const u8 as unsigned decimal integer as u8.
.text
.globl parseU8

/// input x0 [*]const u8
/// input x1 x0.len
/// Output x0 i64
/// If parsed 0<=n<=255 otherwise n<0
parseU8:
mov x12,10 // const
mov x11,0 // result

cbnz x1,.Loop
.L.invalChar:
.L.overflow:
mov x11,-1
.L.ok:
mov x0,x11
ret

.Loop:
mov x9,x0
mov x10,x1
ldr x0,[x9]
bl parseDigit
cmp x0,0
b.mi .L.invalChar

madd x11,x11,x12,x0
cmp x11,0xff
b.gt .L.overflow

add x0,x0,1
sub x1,x1,1
cbz x1,.L.ok
b .Loop
