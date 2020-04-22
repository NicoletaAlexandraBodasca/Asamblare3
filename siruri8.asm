;Se da un sir de dublucuvinte. Sa se creeze un nou sir care cotine cuvintele high care au ultima cifra zecimala egala cu 7 din dublucuvintele date (in interpretarea fara semn).

assume cs:code,ds:data

data segment
	sir dd -2,1,7,-5,-9
	l EQU ($-sir)/4  ;nr de dublucuvinte
	sir_rez dw l dup(?)
	zece db 10
data ends

code segment
start:
	mov ax,data
	mov ds,ax
	
	mov si,2
	mov cx,l
	mov di,0
	
	repeta:
		mov ax,word ptr sir[si]
		mov bl,zece
		div bl
		  ;al-cat,ah-rest
		cmp ah,7
		jne next
		mov ax,word ptr sir[si]
		mov word ptr sir_rez[di],ax 
		add di,2  ;din 2 in 2 pt ca e sir de words
		next:
			add si,4
	loop repeta
	
	mov ax,4c00h
	int 21h
	
code ends
end start

		