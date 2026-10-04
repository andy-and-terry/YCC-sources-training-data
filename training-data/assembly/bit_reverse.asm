; x86-64 NASM: reverse the low 8 bits of a value
section .text
    global _start

reverse_byte:
    ; rdi = byte value -> rax = bit-reversed byte
    xor rax, rax
    mov rcx, 8
.loop:
    shl rax, 1
    mov rdx, rdi
    and rdx, 1
    or rax, rdx
    shr rdi, 1
    dec rcx
    jnz .loop
    ret

_start:
    mov rdi, 0b00010110    ; 22 -> 0b01101000 = 104
    call reverse_byte
    mov rdi, rax
    mov rax, 60
    syscall
