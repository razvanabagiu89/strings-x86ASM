%include "io.mac"

section .text
    global otp
    extern printf

otp:
    ;; DO NOT MODIFY
    push    ebp
    mov     ebp, esp
    pusha

    mov     edx, [ebp + 8]      ; ciphertext
    mov     esi, [ebp + 12]     ; plaintext
    mov     edi, [ebp + 16]     ; key
    mov     ecx, [ebp + 20]     ; length
    ;; DO NOT MODIFY

loop_otp:

    xor al, al
    xor bl, bl
    
    mov al, [esi + (ecx - 1)]
    mov bl, [edi + (ecx - 1)]
    xor al, bl
    mov [edx + (ecx - 1)], al
    
    loop loop_otp

    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY