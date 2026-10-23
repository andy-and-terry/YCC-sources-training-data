; x86-64 NASM (Linux): allocate a page with the mmap syscall, write to it, free it
section .text
    global _start

_start:
    mov rax, 9              ; sys_mmap
    xor rdi, rdi            ; addr = NULL (kernel chooses)
    mov rsi, 4096           ; length = one page
    mov rdx, 3              ; PROT_READ | PROT_WRITE
    mov r10, 0x22           ; MAP_PRIVATE | MAP_ANONYMOUS
    mov r8, -1              ; fd = -1
    xor r9, r9              ; offset = 0
    syscall
    cmp rax, -4095          ; values >= -4095 (unsigned) are errno codes
    jae .fail

    mov rbx, rax            ; keep the base address
    mov qword [rbx], 42     ; use the memory
    mov rdi, [rbx]          ; rdi = 42

    mov rax, 11             ; sys_munmap
    mov rsi, 4096
    push rdi
    mov rdi, rbx
    syscall
    pop rdi
    jmp .exit

.fail:
    mov rdi, 1
.exit:
    mov rax, 60             ; sys_exit, status = 42 on success
    syscall
