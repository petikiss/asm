#!/bin/bash

nasm -f elf32 -g main.asm && gcc -m 32 main.o && ./a.out