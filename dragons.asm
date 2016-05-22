.model  tiny
.data
delaytime		dw		?

.code
    org     0100h
main:   

	mov     ah, 00h         ; Set to 80x25
    mov     al, 03h
    int     10h
		
		mainloop:
		;Move cursor XY
		mov     ah, 02h    
        mov     bh, 00h
        mov     dh, 24     ;y
        mov     dl, 70   ;x
        int     10h
			
		;Char
		mov		ah,09h
		mov		bh,0
		mov		bl,3	;color
		mov		al,67	;ASCII
		mov		cx,1
		int		10h
		
		;String
		mov     ah, 01h
		mov     cx, 2607h  	; hide cursr
        int     10h
		
		mov 	al,1
		mov 	bh,0
		mov 	bl, 2	;color
		mov 	cx, 32		;legnth of char
		mov 	dl,	24		;column
		mov 	dh, 11 		;row
		mov 	bp,  offset title1_1
		mov 	ah, 13h
		int 	10h
		
		mov 	al,1
		mov 	bh,0
		mov 	bl, 4	;color
		mov 	cx, 9		;legnth of char
		mov 	dl,	34		;column
		mov 	dh, 14 		;row
		mov 	bp,  offset title1_2
		mov 	ah, 13h
		int 	10h

		mov		delaytime,3000;
		call	delay
		
		mov 	al,1
		mov 	bh,0
		mov 	bl, 0Fh	;color
		mov 	cx, 32		;legnth of char
		mov 	dl,	24		;column
		mov 	dh, 11 		;row
		mov 	bp,  offset title1_1
		mov 	ah, 13h
		int 	10h
		
		mov 	al,1
		mov 	bh,0
		mov 	bl, 0Eh	;color
		mov 	cx, 9		;legnth of char
		mov 	dl,	34		;column
		mov 	dh, 14 		;row
		mov 	bp,  offset title1_2
		mov 	ah, 13h
		int 	10h
		title1_1 	db "From Blizzard Entertainment Game"
		title1_2 	db "OVERWATCH"
		
		mov		delaytime,3000;
		call	delay
		
		jmp		mainloop
		
		delay:
		xor		bx,bx 
		delayloop:	   
		mov     cx, 00h    ;---------delay-------
		mov     dx, delaytime
		mov     ah, 86H
		int     15H 	   
		inc		bx
		cmp		bx,10
		jne		delayloop
	
		RET

end	main