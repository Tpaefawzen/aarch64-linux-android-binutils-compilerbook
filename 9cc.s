//! Main of 9cc

.text
.globl _start
_start:
//
// [sp] is argc: i32
// [sp+8] is argv[0]: ?[*]const u8
// [sp+16] is argv[1]: ?[*]const u8
// ...
//
ldr x0,[sp]
//
// x0: i32 is argc
//
cmp x0,2
b.lt errorUsage

bl genPreamble

ldr x0,[sp,16]
bl szToSlice
//
// x0 = argv[1]: [*]const u8
// x1 = x0.len
//
bl sliceInt
cbz x1,bl.errorNotInt
stp x0,x1,[sp,-16]!
bl parseIntU32
cbz x1,errorOverflow
mov x2,x1
ldp x0,x1,[sp],16
bl sliceSlice

.L.parse:
cbz x1,.L.finally
stp x0,x1,[sp,-16]!

ldr x19,[sp]
ldr x20,[x19]

cmp x20,0x2B // plus sign
b.eq .L.genAdd
cmp x20,0x2D // minus sign
b.eq .L.genSub
cbz x21,errorUnkChar

.L.genAdd:
add x0,x0,1
sub x1,x1,1
bl tryGenAdd
//
// x0,x1 is updated
b .L.parse

.L.genSub:
add x0,x0,1
sub x1,x1,1
bl tryGenSub
//
// x0,x1 is updated
b .L.parse

.L.finally:
bl genPostamble

mov x0,0
mov x8,93
svc 0
