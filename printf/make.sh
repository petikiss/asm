#!/bin/bash

nasm -f elf32 -g main.asm && gcc -m32 main.o && ./a.out