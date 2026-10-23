; x86-64 NASM: same bits, signed vs unsigned comparison via setcc
; compares -1 with 1: signed less (setl) = 1, unsigned below (setb) = 0
; exit status: 2
section .text
    global _start

_start:
    mov rax, -1
    mov rcx, 1
    cmp rax, rcx
    setl dl             ; signed: -1 < 1
    setb bl             ; unsigned: 0xFFFF...FFFF < 1 is false
    movzx edi, dl
    shl edi, 1          ; signed result in bit 1
    movzx ebx, bl
    or edi, ebx         ; unsigned result in bit 0
    mov rax, 60
    syscall
