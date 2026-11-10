; x86-64 NASM: central Delannoy number D(3,3) via a rolling row -> exit code 63
section .bss
    row resq 4

section .text
    global _start

_start:
    mov rcx, 4
    lea rdi, [rel row]
    mov rax, 1
.init:
    mov [rdi + rcx*8 - 8], rax   ; row[j] = 1 (this is row i = 0)
    loop .init
    mov r8, 1                    ; i
.rows:
    cmp r8, 3
    jg .done
    mov r9, [rel row]            ; diagonal = old row[0]
    mov qword [rel row], 1       ; row[0] = 1
    mov r10, 1                   ; j
.cols:
    cmp r10, 3
    jg .next
    lea rdi, [rel row]
    mov r11, [rdi + r10*8]       ; old row[j] (up)
    mov rax, r11
    add rax, [rdi + r10*8 - 8]   ; + left (new row[j-1])
    add rax, r9                  ; + diagonal
    mov r9, r11
    mov [rdi + r10*8], rax
    inc r10
    jmp .cols
.next:
    inc r8
    jmp .rows
.done:
    mov rdi, [rel row + 24]
    mov rax, 60
    syscall
