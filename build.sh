#!/bin/bash
nasm -f elf main.asm; ld -m elf_i386 -o main main.o; rm main.o
