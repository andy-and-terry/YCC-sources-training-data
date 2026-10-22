; x86-64 NASM: first 20 terms of the Recaman sequence, exit with the last term (62)
section .bss
    seen  resb 128
    terms resq 20

section .text
    global _start

_start:
    xor rax, rax            ; cur = 0
    mov byte [seen], 1
    mov qword [terms], 0
    mov rcx, 1              ; i = 1
recaman_loop:
    cmp rcx, 20
    jge recaman_done
    mov rbx, rax
    sub rbx, rcx            ; candidate = cur - i
    js recaman_add          ; negative -> add instead
    cmp byte [seen + rbx], 0
    je recaman_take         ; unseen -> keep candidate
recaman_add:
    mov rbx, rax
    add rbx, rcx            ; candidate = cur + i
recaman_take:
    mov byte [seen + rbx], 1
    mov rax, rbx
    mov [terms + rcx*8], rax
    inc rcx
    jmp recaman_loop
recaman_done:
    mov rdi, [terms + 19*8] ; 20th term = 62
    mov rax, 60
    syscall
