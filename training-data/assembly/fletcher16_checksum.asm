; x86-64 NASM: Fletcher-16 of "abcde"; exit code is the low byte (s1 = 0xf0)
section .data
    msg db "abcde"
section .text
    global _start

_start:
    xor r8d, r8d            ; s1
    xor r9d, r9d            ; s2
    lea rsi, [rel msg]
    mov rcx, 5
.loop:
    movzx eax, byte [rsi]
    add r8d, eax
    mov eax, r8d
    xor edx, edx
    mov ebx, 255
    div ebx
    mov r8d, edx            ; s1 = (s1 + b) % 255
    add r9d, r8d
    mov eax, r9d
    xor edx, edx
    div ebx
    mov r9d, edx            ; s2 = (s2 + s1) % 255
    inc rsi
    loop .loop
    mov edi, r8d
    mov eax, 60
    syscall
