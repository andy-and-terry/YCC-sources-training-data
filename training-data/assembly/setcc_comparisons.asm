; x86-64 NASM: materialize comparison results as 0/1 using setcc
; signed and unsigned comparisons of -1 and 1 differ
section .text
    global _start

_start:
    mov rax, -1                ; 0xFFFF...FFFF
    mov rbx, 1
    xor rdi, rdi

    cmp rax, rbx
    setl cl                    ; signed:   -1 < 1      -> 1
    setb dl                    ; unsigned: 0xFF.. < 1  -> 0
    setne r8b                  ; not equal             -> 1

    movzx rcx, cl
    movzx rdx, dl
    movzx r8, r8b

    ; pack the three flags into the exit status: bit0=signed, bit1=unsigned, bit2=ne
    mov rdi, rcx
    shl rdx, 1
    or rdi, rdx
    shl r8, 2
    or rdi, r8                 ; 0b101 = 5

    mov rax, 60
    syscall
