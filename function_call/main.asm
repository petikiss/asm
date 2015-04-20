extern printf

section .data
    op1 dd 5
    op2 dd 10
    fmt db 'result=%d',10,0
    msg db 'marci',10,0
    msg2 db 'marci2',10,0


global main
section .text

    main:
       push dword op2
       push dword op1
       call osszeadas
       add esp, 8

       push dword [eax]
       push dword fmt
       call printf

       mov eax, 1 ; exit
       mov ebx, 0
       int 0x80

    osszeadas:
      push ebp
      mov  ebp, esp

      sub esp, 8
      mov eax, [ebp+4] ; op1
      mov ebx, [ebp+8] ; op2
      add eax, ebx

      push msg
      call printf

      push eax
      push dword fmt
      call printf

      push msg2
      call printf


      mov esp, ebp
      pop ebp
      ret
