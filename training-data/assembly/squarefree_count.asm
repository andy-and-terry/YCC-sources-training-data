; x86-64 NASM: count squarefree numbers in [1, 30] (where the Moebius function is nonzero).
; A number is squarefree when no p*p (p = 2..5) divides it. Expected: 19 -> exit code 19
section .text
    global _start

_start:
    xor r12, r12            ; count
    mov r8, 1               ; n
.next_n:
    cmp r8, 30
    jg .done
    mov r9, 2               ; p
.next_p:
    cmp r9, 5
    jg .squarefree
    mov rax, r9
    imul rax, r9            ; p*p
    mov rcx, rax
    mov rax, r8
    xor rdx, rdx
    div rcx
    test rdx, rdx
    jz .skip                ; p*p divides n
    inc r9
    jmp .next_p
.squarefree:
    inc r12
.skip:
    inc r8
    jmp .next_n
.done:
    mov rdi, r12
    mov rax, 60
    syscall
