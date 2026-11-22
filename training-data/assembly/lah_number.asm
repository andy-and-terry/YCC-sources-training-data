; x86-64 NASM: unsigned Lah number L(5, 2) = C(4, 1) * 5! / 2! = 240.
; Expected: 240 -> exit code 240
section .text
    global _start

; fact(rdi = n) -> rax
fact:
    mov rax, 1
.loop:
    cmp rdi, 1
    jle .done
    imul rax, rdi
    dec rdi
    jmp .loop
.done:
    ret

_start:
    mov rdi, 4
    call fact
    mov r8, rax             ; 4!
    mov rdi, 1
    call fact
    mov r9, rax             ; 1!
    mov rdi, 3
    call fact
    imul r9, rax            ; 1! * 3!
    mov rax, r8
    xor rdx, rdx
    div r9                  ; C(4,1) = 4
    mov r10, rax
    mov rdi, 5
    call fact
    imul r10, rax           ; C * 5!
    mov rdi, 2
    call fact
    mov rcx, rax
    mov rax, r10
    xor rdx, rdx
    div rcx                 ; / 2!
    mov rdi, rax
    mov rax, 60
    syscall
