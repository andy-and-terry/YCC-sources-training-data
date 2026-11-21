; x86-64 NASM: count bouncy numbers below 200 (digits neither non-decreasing
; nor non-increasing). Expected: 53 (101..109 start the run) -> exit code 53
section .text
    global _start

; is_bouncy(rdi = n) -> rax = 1/0
is_bouncy:
    mov rax, rdi
    xor rdx, rdx
    mov r8, 10
    div r8                  ; rax = n / 10, rdx = last digit
    mov r9, rdx             ; prev
    mov r10, 1              ; inc flag
    mov r11, 1              ; dec flag
.loop:
    test rax, rax
    jz .done
    xor rdx, rdx
    div r8                  ; rdx = next digit (moving left)
    cmp rdx, r9
    jle .not_greater
    xor r10, r10            ; digit > prev (to the right) -> not non-decreasing
.not_greater:
    cmp rdx, r9
    jge .not_less
    xor r11, r11
.not_less:
    mov r9, rdx
    jmp .loop
.done:
    ; bouncy when neither flag is set
    mov rax, r10
    or rax, r11
    xor rax, 1
    ret

_start:
    xor r12, r12
    mov r13, 1
.next:
    cmp r13, 200
    jge .finish
    mov rdi, r13
    call is_bouncy
    add r12, rax
    inc r13
    jmp .next
.finish:
    mov rax, 60
    mov rdi, r12
    syscall
