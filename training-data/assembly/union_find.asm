; x86-64 NASM: disjoint-set union-find with path compression
section .data
    parent dq 0, 1, 2, 3, 4, 5
    count equ 6

section .text
    global _start

; rdi = x; returns root of x in rax, compressing the path along the way
find:
    mov rax, rdi
find_loop:
    mov rcx, [parent + rax * 8]
    cmp rcx, rax
    je find_done
    mov rax, rcx
    jmp find_loop
find_done:
    mov rcx, rdi
compress_loop:
    mov rdx, [parent + rcx * 8]
    cmp rdx, rax
    je compress_done
    mov [parent + rcx * 8], rax
    mov rcx, rdx
    jmp compress_loop
compress_done:
    ret

; rdi = x, rsi = y; unions the sets containing x and y
union_sets:
    push rsi
    call find                 ; rax = root(x)
    mov r8, rax
    pop rsi
    mov rdi, rsi
    call find                  ; rax = root(y)
    mov r9, rax
    cmp r8, r9
    je union_done
    mov [parent + r8 * 8], r9
union_done:
    ret

_start:
    mov rdi, 0
    mov rsi, 1
    call union_sets
    mov rdi, 1
    mov rsi, 2
    call union_sets
    mov rdi, 3
    mov rsi, 4
    call union_sets

    ; check whether 0 and 2 ended up in the same set
    mov rdi, 0
    call find
    mov r10, rax
    mov rdi, 2
    call find
    cmp r10, rax
    je connected
    mov rdi, 0
    jmp exit
connected:
    mov rdi, 1
exit:
    mov rax, 60
    syscall
