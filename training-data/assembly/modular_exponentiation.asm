; x86-64 NASM: modular exponentiation via square-and-multiply (4^13 mod 497 = 445)
section .text
    global _start

_start:
    mov rbx, 4            ; base
    mov rcx, 13           ; exponent
    mov r8, 497           ; modulus

    mov rax, rbx
    xor rdx, rdx
    div r8
    mov rbx, rdx           ; base := base mod m
    mov rax, 1              ; result := 1

modexp_loop:
    cmp rcx, 0
    je modexp_done

    test rcx, 1
    jz modexp_skip_mult
    mul rbx                 ; rdx:rax = result * base
    div r8                    ; rdx = (result * base) mod m
    mov rax, rdx
modexp_skip_mult:
    push rax
    mov rax, rbx
    mul rbx                     ; rdx:rax = base * base
    div r8                        ; rdx = (base * base) mod m
    mov rbx, rdx
    pop rax

    shr rcx, 1
    jmp modexp_loop

modexp_done:
    mov rdi, rax
    mov rax, 60
    syscall
