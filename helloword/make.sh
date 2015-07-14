#!/bin/bash

nasm -f elf32 main.asm && gcc -m32 main.o && ./a.out