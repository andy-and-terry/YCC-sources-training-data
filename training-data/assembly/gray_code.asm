; x86-64 NASM: binary to Gray code and back
;   gray = n ^ (n >> 1)
;   inverse: fold successive right shifts with xor
section .text
    global _start

_start:
    mov rax, 13                ; binary 1101
    mov rbx, rax
    shr rbx, 1
    xor rbx, rax               ; rbx = Gray code = 1011 = 11

    ; decode back to binary
    mov rax, rbx               ; rax = gray
    mov rcx, rax
decode_loop:
    shr rcx, 1
    jz decode_done
    xor rax, rcx
    jmp decode_loop
decode_done:
    ; rax should be 13 again; exit with gray code (11) if round trip is ok
    cmp rax, 13
    jne failed
    mov rdi, rbx
    jmp finish
failed:
    mov rdi, 255
finish:
    mov rax, 60
    syscall
