; x86-64 NASM: read argc straight off the initial process stack layout.
; At _start (no libc), the kernel places argc as the first qword on the
; stack, followed by argv[0..argc-1] and then a NULL, then envp.
section .text
    global _start

_start:
    mov rax, [rsp]        ; argc (program name counts as argv[0])
    mov rdi, rax
    mov rax, 60
    syscall
