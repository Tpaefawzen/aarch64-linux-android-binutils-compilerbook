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

ldr x0,[sp,16]
bl szToSlice
//
// x0 = argv[1]: [*]const u8
// x1 = x0.len
//
mov x19,x0
mov x20,x1
bl isInt
cbz x0,errorNotInt

ldr x0,=.const._start
mov x1,6
bl codegen.genGlobl
ldr x0,=.const._start
mov x1,6
bl codegen.genLabel
mov x0,x19
mov x1,x20
bl codegen.genMov
bl codegen.genRet

mov x0,0
mov x8,93
svc 0

.data
.const._start: .ascii "_start"
