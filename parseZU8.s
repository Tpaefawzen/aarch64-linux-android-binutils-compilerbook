//! Try to parse [:0]const u8 as unsigned decmial integer as u8.
.text
.globl parseZU8

/// input x0 [*:0]const u8
/// Output x0 i64
/// If parsed 0<=n<=255 otherwise n<0
parseZU8:
mov x12,10 // const
mov x11,0 // result

ldr x1,[x0]
cbnz x1,.Loop
.L.invalChar:
.L.overflow:
mov x11,-1
.L.ok:
mov x0,x11
ret

.Loop:
mov x9,x0
ldr x0,[x9]
bl parseDigit
cmp x0,0
b.mi .L.invalChar

madd x11,x11,x12,x0
cmp x11,0xff
b.gt .L.overflow

add x0,x0,1
ldr x1,[x0]
cbz x1,.L.ok
b .Loop
