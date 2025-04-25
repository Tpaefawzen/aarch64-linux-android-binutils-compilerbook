#!/bin/sh

set -eu
fail=0

# 1: Expr 2: Expected
assert() {
   ./9cc "$1" > __tmp.s
   as -o __tmp.o __tmp.s
   ld -o __tmp __tmp.o
   ./__tmp && :
   case $? in "$2")
      printf '%s\n' "$1 => $2"
  ;;*)
      printf '%s\n' "[FAIL] $1 => $? (expected $2)"
      fail=1
  ;;esac
}

assert 0 0
assert 42 42

exit $fail
