#!/bin/bash

nasm -f elf32 hello.asm && gcc -m32 hello.o && ./a.out