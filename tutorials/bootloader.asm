ORG 0x7C00          ; Boot sector is loaded at 0x7C00 by BIOS
BITS 16             ; We are in 16-bit real mode

jmp _start          ; Jump to main bootloader start

; check filesystems article to add a filesystem to the first sector

; Bootloader entry point
_start:
    mov ah, 0x0E
    mov al, 'H'
    int 0x10
    mov al, 'i'
    int 0x10
    mov al, '!'
    int 0x10
    hlt

; Bootloader padding to 512 bytes
times 510-($-$$) db 0
dw 0xAA55          ; Boot signature
