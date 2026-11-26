; x86-64 NASM: squarefree numbers up to 100
; Expected result 61 is returned as the process exit code.
section .text
    global _start

_start:
    xor r12, r12            ; count
    mov r13, 1
.next:
    cmp r13, 101
    jge .done
    mov r14, 2              ; d
.sq:
    mov rax, r14
    imul rax, r14
    cmp rax, r13
    jg .free
    mov rcx, rax
    mov rax, r13
    xor edx, edx
    div rcx
    test rdx, rdx
    jz .skip
    inc r14
    jmp .sq
.free:
    inc r12
.skip:
    inc r13
    jmp .next
.done:
    mov rdi, r12
    mov eax, 60
    syscall
