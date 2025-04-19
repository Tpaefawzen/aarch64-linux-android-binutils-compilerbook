Doing Rui Ueyama's [compilerbook](https://www.sigbus.info/compilerbook) in assembly language for aarch64 linux

## Dependencies
* GNU binutils

## Why assembly not C
Wanted not to install big clang
Also I had tcc but standard C libary headers were on clang package which is not my desire
Also tcc had no Arm assembly support

## Why began
at first wanted to compile Zig sourfe on Termux environment but the Zig compiler didn't work because of Illegal Instruction (v0.14.0); also tried compiling from source; was exhausting because it takes pretty long time; thought if smaller Zig could be implemented by myself.

## License
Copyright (C) 2025 Tpaefawzen

Creative Commons Zero v1.0 Universal; OR; MIT License
