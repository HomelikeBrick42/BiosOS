print:
	pusha				; Rembember old register values on the stack so we can set them back

	mov ah, 0x0e		; Set mode to TTY

	start_print:

	mov al, [bx]		; Get the value in pointed to by bx

	cmp al, 0			; Check if 0 then end of string so exit
	je end_print

	int 0x10			; Write character that is in al

	add bx, 1			; Add one to the pointer to move to the next character
	jmp start_print		; Go to the start

	end_print:

	popa				; Set the registers to their old values
	ret

print_nl:
	pusha

	mov ah, 0x0e	; Set mode to TTY

	mov al, 0x0a	; newline
	int 0x10
	mov al, 0x0d	; carrage return
	int 0x10

	popa
	ret
