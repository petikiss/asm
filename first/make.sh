#!/bin/bash

nasm -f elf32 hello.asm
ld hello.o
./a.out