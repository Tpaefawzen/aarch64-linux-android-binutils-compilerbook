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
b.lt _usage

ldr x0,[sp,16]
bl szToSlice
//
// x0 = argv[1]: [*]const u8
// x1 = x0.len
//
stp x0,x1,[sp,-16]!
bl isInt
cbz x0,errorNotInt
ldp x0,x1,[sp],16
mov x8,93

mov x0,0
svc 0
