[org 0x7c00]	; Where this binary will be placed in memory

mov bp, 0x8000	; Set address far away so the code does not get overrwritten by the stack
mov sp, bp		; Set stack to top

mov bx, hello_string
call print
call print_nl

mov bx, goodbye_string
call print
call print_nl

jmp $					; Jump to current location - Infinite loop

hello_string:
	db "Hello World!", 0

goodbye_string:
	db "Goodbye.", 0

%include "OS_Print.asm"

times 510-($-$$) db 0	; Fill with 510 zeros minus the size of the code
dw 0xaa55				; The 511th and 512th byte tells the bios that this is an operating system
