; x86-64 NASM: first 15 Ulam numbers, exit with the last term (47)
section .bss
    terms resq 15

section .text
    global _start

_start:
    mov qword [terms], 1
    mov qword [terms + 8], 2
    mov r8, 2               ; found = 2
    mov r9, 2               ; candidate
ulam_loop:
    cmp r8, 15
    jge ulam_done
    inc r9
    xor r10, r10            ; ways = 0
    xor rsi, rsi            ; a = 0
ulam_a:
    cmp rsi, r8
    jge ulam_check
    lea rdi, [rsi + 1]      ; b = a + 1
ulam_b:
    cmp rdi, r8
    jge ulam_a_next
    mov rax, [terms + rsi*8]
    add rax, [terms + rdi*8]
    cmp rax, r9
    jne ulam_b_next
    inc r10
ulam_b_next:
    inc rdi
    jmp ulam_b
ulam_a_next:
    inc rsi
    jmp ulam_a
ulam_check:
    cmp r10, 1
    jne ulam_loop
    mov [terms + r8*8], r9
    inc r8
    jmp ulam_loop
ulam_done:
    mov rdi, [terms + 14*8] ; 15th term = 47
    mov rax, 60
    syscall
