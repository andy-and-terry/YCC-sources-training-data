; x86-64 NASM: switch statement implemented with a jump table of addresses
section .data
    jump_table dq case0, case1, case2, case3

section .text
    global _start

_start:
    mov rcx, 2                 ; selector value
    cmp rcx, 3
    ja default_case            ; out of range
    lea rax, [jump_table]
    jmp [rax + rcx*8]          ; indirect jump through the table

case0:
    mov rdi, 10
    jmp done
case1:
    mov rdi, 20
    jmp done
case2:
    mov rdi, 30                ; selected: exit status 30
    jmp done
case3:
    mov rdi, 40
    jmp done
default_case:
    mov rdi, 255
done:
    mov rax, 60
    syscall
