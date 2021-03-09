%include "io.mac"

section .text
    global vigenere
    extern printf
section .data
    countPlain dw 0
    countKey dw 0
    lenKey  dw  0

vigenere:
    ;; DO NOT MODIFY
    push    ebp
    mov     ebp, esp
    pusha

    mov     edx, [ebp + 8]      ; ciphertext
    mov     esi, [ebp + 12]     ; plaintext
    mov     ecx, [ebp + 16]     ; plaintext_len
    mov     edi, [ebp + 20]     ; key
    mov     ebx, [ebp + 24]     ; key_len
    ;; DO NOT MODIFY

    mov [countKey], word 0
    mov [countPlain], word 0
    mov [lenKey], bl ; save length of key
    xor eax, eax
    xor ebx, ebx

loop_vigenere:

    mov bl, [countPlain]
    cmp bl, cl
    je RET
    mov al, [esi + ebx]

    cmp al, 'A'
    jb DIGIT

    cmp al, 'Z'
    jb CAPITAL

    cmp al, 'a'
    jb DIGIT

    cmp al, 'z'
    jg DIGIT
    
CONTINUE:

    mov bl, [countKey]
    cmp bl, [lenKey]
    je RESETCOUNTKEY
    add al, [edi + ebx]
    sub al, 65
    sub al, 97

    xor ebx, ebx
    mov bh, 26
    div bh
    xor ebx, ebx
    
    mov bl, [countPlain]
    mov [edx + ebx], ah 
    add [edx + ebx], byte 97

    inc word [countKey]
    inc word [countPlain]

    ; reset
    xor eax, eax 
    xor ebx, ebx 
    jmp loop_vigenere

; if capital letter
CAPITAL:

    mov bl, [countKey]
    cmp bl, [lenKey]
    je RESETCOUNTKEYCAPITAL
    add al, [edi + ebx]
    sub al, 65
    sub al, 65 

    xor ebx, ebx
    mov bh, 26
    div bh
    xor ebx, ebx
    
    mov bl, [countPlain] 
    mov [edx + ebx], ah 
    add [edx + ebx], byte 65

    inc word [countKey]
    inc word [countPlain]

    xor eax, eax 
    xor ebx, ebx 
    jmp loop_vigenere

; if any other character
DIGIT:

    mov bl, [countPlain]
    mov [edx + ebx], al
    inc word [countPlain]

    xor eax, eax 
    xor ebx, ebx 
    jmp loop_vigenere

RESETCOUNTKEY:
    mov [countKey], word 0
    jmp CONTINUE

RESETCOUNTKEYCAPITAL:
    mov [countKey], word 0
    jmp CAPITAL

RET:
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY