section .text
global _start
f:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    mov dword [rbp-4], 5
    mov dword [rbp-8], 6
    mov eax, [rbp-4]
    add eax, [rbp-8]
    leave
    ret
_start:
    call f
    mov edi, eax
    mov eax, 60
    syscall
