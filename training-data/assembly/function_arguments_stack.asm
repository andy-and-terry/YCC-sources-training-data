; x86-64 NASM: pass function arguments via the stack (cdecl-style push/call,
; caller cleans up) instead of through registers
section .text
    global _start

; reads three qword arguments pushed by the caller, above the return
; address: [rsp+8], [rsp+16], [rsp+24]
sum3:
    mov rax, [rsp + 8]
    add rax, [rsp + 16]
    add rax, [rsp + 24]
    ret

_start:
    push 30
    push 20
    push 10
    call sum3
    add rsp, 24              ; caller discards the three pushed arguments
    mov rdi, rax              ; expected: 10 + 20 + 30 = 60
    mov rax, 60
    syscall
