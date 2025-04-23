//! Try to parse [:0]const u8 as unsigned decmial integer as u8.
.text
.globl parseZU8
/// input x0 [*:0]const u8
/// Output x0 i64
/// If parsed 0<=n<=255 otherwise n<0
parseZU8:
mov x12,10 // const
mov x11,0 // result
sub x9,x0,1
ldr x0,[x0]
// check for character
mov x1,x0
cbz x0,.L.invalChar
.L.loop:
add x9,x0,1
mov x0,x9
ldr x0,[x0]
cbz x1,.L.ok
bl parseDigit
cmp x0,0
b.mi .L.invalChar
madd x11,x11,x10,x0
cmp x11,256
b.ge .L.overflow
b .L.loop
.L.invalChar:
mov x0,-1
ret
.L.overflow:
mov x11,-2
.L.ok:
mov x0,x11
ret
