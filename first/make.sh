#!/bin/bash

nasm -f elf32 hello.asm
gcc hello.o
./a.out