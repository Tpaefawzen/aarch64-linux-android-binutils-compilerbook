#!/bin/sh

# Generates an assembly language for aarch64-linux

case $# in 0)
  echo Usage: 9cc VALUE 1>&2
  exit 1
esac

case $1 in ''|*[!0-9]*)
  echo Error: Expected decimal positive integer 1>&2
  exit 1
esac

cat <<-__EOF__
.global _start
_start:
 mov x0, #$1
 mov x8, #93
 svc #0
__EOF__
