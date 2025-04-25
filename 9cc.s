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
stp x0,x1,[sp,-16]!
bl isInt
cbz x0,errorNotInt

mov x0,0
ldr x1,=.const.preamble
ldr x2,=.const.preamble.len
bl write

mov x0,0
ldp x1,x2,[sp],16
bl write

mov x0,0
ldr x1,=.const.postamble
ldr x2,=.const.postamble.len
bl write

mov x0,0
mov x8,93
svc 0

.data
.const.preamble: .ascii ".globl _start\n_start:\nmov x0,"
.const.preamble.len = . - .const.preamble
.const.postamble: .ascii "\nmov x8,93\nsvc 0\n"
.const.postamble.len = . - .const.postamble
