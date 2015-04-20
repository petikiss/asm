#!/bin/bash

nasm -f elf32 -g main.asm
gcc main.o && ./a.out