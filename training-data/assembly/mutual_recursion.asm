; x86-64 NASM: determine parity of n via mutual recursion between
; is_even and is_odd (a classic stack-frame recursion idiom)
section .text
    global _start

; rdi = n -> returns 1 in rax if n is even, 0 otherwise
is_even:
    push rbp
    mov rbp, rsp
    cmp rdi, 0
    jne ie_recurse
    mov rax, 1
    jmp ie_done
ie_recurse:
    dec rdi
    call is_odd
ie_done:
    mov rsp, rbp
    pop rbp
    ret

; rdi = n -> returns 1 in rax if n is odd, 0 otherwise
is_odd:
    push rbp
    mov rbp, rsp
    cmp rdi, 0
    jne io_recurse
    mov rax, 0
    jmp io_done
io_recurse:
    dec rdi
    call is_even
io_done:
    mov rsp, rbp
    pop rbp
    ret

_start:
    mov rdi, 10
    call is_even
    mov rdi, rax               ; expected: 1 (10 is even)
    mov rax, 60
    syscall
