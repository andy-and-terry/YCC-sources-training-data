; x86-64 NASM: Jacobsthal numbers J0=0, J1=1, Jn = J(n-1) + 2*J(n-2)
; computes J14 = 5461; exit status is 5461 mod 256 = 85
section .text
    global _start

_start:
    xor rax, rax               ; a = J(0)
    mov rbx, 1                 ; b = J(1)
    mov rcx, 14                ; advance 14 times -> a = J(14)
.loop:
    lea rdx, [rbx + rax*2]     ; next = b + 2a
    mov rax, rbx
    mov rbx, rdx
    dec rcx
    jnz .loop
    mov rdi, rax               ; exit status = low byte of J(14)
    mov rax, 60                ; sys_exit
    syscall
