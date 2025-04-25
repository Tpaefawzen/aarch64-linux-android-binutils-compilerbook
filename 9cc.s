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

ldr x19,[sp,16]
//
// x19: [*]const u8
//
mov x0,x19
bl szToSlice
//
// x19: [*]const u8
// x0: u64
//
mov x10,x0 // szlen(argv[1])
mov x8,93
svc 0
