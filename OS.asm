[org 0x7c00]	; Where this binary will be placed in memory

mov ah, 0x0e 	; Set bios mode to tty - (TeleTYpe)

mov al, 'H'		; Character to write
int 0x10		; Write character

mov al, 'e'
int 0x10

mov al, 'l'
int 0x10
int 0x10		; Character is still set

mov al, 'o'
int 0x10

jmp $					; Jump to current location - Infinite loop

times 510-($-$$) db 0	; Fill with 510 zeros minus the size of the code
dw 0xaa55				; The 511th and 512th byte tells the bios that this is an operating system
