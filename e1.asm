data segment
	one db 20 dup(32),'HELLO!     ',7,13,10
	count equ $-one
data ends

code segment
	assume cs:code,ds:data
start:
	mov ax,seg data
	mov ds,ax
	mov si,offset one
	mov cx,count
next:
	mov dl,[si]
	mov ah,2
	int 21h
	inc si
	loop next
	mov ah,4ch
	int 21h
code ends
end start
