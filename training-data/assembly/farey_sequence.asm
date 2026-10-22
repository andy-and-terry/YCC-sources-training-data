; x86-64 NASM: count the terms of the Farey sequence F_5 (0/1 1/5 1/4 ... 1/1)
; Next-term rule: k = (n + b) / d; (a/b, c/d) -> (c/d, (k*c - a)/(k*d - b))
section .text
    global _start

_start:
    mov r12, 5          ; n
    xor r8, r8          ; a = 0
    mov r9, 1           ; b = 1
    mov r10, 1          ; c = 1
    mov r11, r12        ; d = n
    mov r13, 1          ; term count (0/1 already emitted)
farey_loop:
    cmp r10, r12
    jg farey_done       ; stop once c > n
    mov rax, r12
    add rax, r9
    xor rdx, rdx
    div r11             ; rax = k = (n + b) / d
    mov rbx, rax
    imul rbx, r10
    sub rbx, r8         ; e = k*c - a
    imul rax, r11
    sub rax, r9         ; f = k*d - b
    mov r8, r10         ; a = c
    mov r9, r11         ; b = d
    mov r10, rbx        ; c = e
    mov r11, rax        ; d = f
    inc r13
    jmp farey_loop
farey_done:
    ; r13 = 11 terms; exit with it as status code
    mov rdi, r13
    mov rax, 60
    syscall
