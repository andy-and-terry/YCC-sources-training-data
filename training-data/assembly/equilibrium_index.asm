; x86-64 NASM: equilibrium index of {1,7,3,6,5,6}; exit status = index (3)
section .data
nums:   dd 1, 7, 3, 6, 5, 6
count   equ 6

section .text
    global _start

_start:
    xor ecx, ecx            ; i
    xor edx, edx            ; total
sum_loop:
    add edx, [nums + rcx*4]
    inc ecx
    cmp ecx, count
    jl sum_loop

    xor ecx, ecx            ; i
    xor esi, esi            ; left
scan_loop:
    mov eax, edx
    sub eax, esi
    sub eax, [nums + rcx*4] ; right = total - left - nums[i]
    cmp eax, esi
    je found
    add esi, [nums + rcx*4]
    inc ecx
    cmp ecx, count
    jl scan_loop
    mov edi, -1
    jmp done
found:
    mov edi, ecx
done:
    mov eax, 60
    syscall
