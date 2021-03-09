%include "io.mac"

section .text
    global caesar
    extern printf

caesar:
    ;; DO NOT MODIFY
    push    ebp
    mov     ebp, esp
    pusha

    mov     edx, [ebp + 8]      ; ciphertext
    mov     esi, [ebp + 12]     ; plaintext
    mov     edi, [ebp + 16]     ; key
    mov     ecx, [ebp + 20]     ; length

    ;; DO NOT MODIFY

    xor eax, eax
    xor ebx, ebx

loop_caesar:

    mov al, [esi + (ecx - 1)]

    cmp al, 'A'
    jb DIGIT

    cmp al, 'Z'
    jb CAPITAL 

    cmp al, 'a'
    jb DIGIT

    cmp al, 'z'
    jg DIGIT

    mov ebx, edi
    mov bh, 0

    mov bh, 26
    add al, bl
    sub al, 97
    div bh
    mov [edx + (ecx - 1)], ah
    add [edx + (ecx - 1)], byte 97
    xor eax, eax ; reset
    xor ebx, ebx
    loop loop_caesar
    jmp RET

; if capital letter
CAPITAL:

    mov ebx, edi
    mov bh, 0 ; edi se afla in bl

    mov bh, 26
    add al, bl
    sub al, 65
    div bh
    mov [edx + (ecx - 1)], ah
    add [edx + (ecx - 1)], byte 65
    dec ecx
    cmp ecx, 0
    jz RET
    ; reset
    xor eax, eax
    xor ebx, ebx
    jmp loop_caesar

; if any other character
DIGIT:

    mov [edx + (ecx - 1)], al
    dec ecx
    cmp ecx, 0
    jz RET
    xor eax, eax
    xor ebx, ebx
    jmp loop_caesar

RET:
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY