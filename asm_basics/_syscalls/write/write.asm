; Writin "Hello word" to the std output

    global _start

    section .rodata
       msg: db "Hello world", 10 ; 10 == '\n'
       msglen: equ $ - msg

    section .text
_start:
      mov rax, 1 ; sys_write
      mov rdi, 1 ; std output
      mov rsi, msg
      mov rdx, msglen
      syscall

      mov rax, 60 ; sys_exit
      mov rdi, 0
      syscall