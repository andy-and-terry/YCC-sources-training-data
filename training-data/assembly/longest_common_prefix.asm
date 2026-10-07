; x86-64 NASM: length of the longest common prefix shared by three strings
section .data
    s1 db "flower", 0
    s2 db "flow", 0
    s3 db "flight", 0

section .text
    global _start

_start:
    xor r8, r8                 ; prefix length so far
lcp_loop:
    movzx rax, byte [s1 + r8]
    test al, al
    jz lcp_done                ; hit end of the shortest reference string
    movzx rbx, byte [s2 + r8]
    cmp al, bl
    jne lcp_done
    test bl, bl
    jz lcp_done
    movzx rcx, byte [s3 + r8]
    cmp al, cl
    jne lcp_done
    inc r8
    jmp lcp_loop
lcp_done:
    ; expected common prefix is "fl", length 2
    mov rdi, r8
    mov rax, 60
    syscall
