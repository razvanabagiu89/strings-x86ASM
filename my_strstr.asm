%include "io.mac"

section .text
    global my_strstr
    extern printf
section .data
    isValid dw 0
    count dw 0
    index  dw  0

my_strstr:
    ;; DO NOT MODIFY
    push    ebp
    mov     ebp, esp
    pusha

    mov     edi, [ebp + 8]      ; substr_index
    mov     esi, [ebp + 12]     ; haystack
    mov     ebx, [ebp + 16]     ; needle
    mov     ecx, [ebp + 20]     ; haystack_len
    mov     edx, [ebp + 24]     ; needle_len
    ;; DO NOT MODIFY

    mov [isValid], word 0
    mov [count], word 0
    mov [index], word 0
    sub edx, 1
    
TRY:
    xor eax, eax
    mov ebx, [ebp + 16] ; reset substring

    mov al, byte [ebx]
    cmp [esi], al
    jne NEXTCHAR

    ; first char matches 
    mov ah, byte [count]
    mov [index], ah
    cmp edx, 0
    je FINAL
    xor eax, eax

   ; verify next chars 
VALIDATE:
   
    inc esi
    inc ebx
    inc word [count]
    mov al, byte [ebx]
    cmp [esi], al
    jne TRY
   
    inc word [isValid]
    cmp [isValid], edx
    je FINAL
    xor eax, eax
    jne VALIDATE

FINAL:

    xor eax, eax
    mov ax, word [index]
    mov [edi], ax
    jmp RET

NEXTCHAR:

    inc esi
    inc word [count]
    cmp [count], cx
    je FAILED
    jmp TRY

FAILED:

    mov [edi], cx
    add [edi], word 1

RET:
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY
