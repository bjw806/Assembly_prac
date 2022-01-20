include irvine32.inc

.data
array dword 1,7,9,33,5,22,63,41,21,55
.code
main proc
	mov EDI,OFFSET array
	mov ECX,LENGTHOF array
	call BubbleSort

	mov ECX,LENGTHOF array
	mov ESI,OFFSET array
l2:
	mov EAX,[ESI]
	call WriteDec
	call Crlf
	add ESI, 4
	loop l2

	exit
main endp


BubbleSort proc uses eax ecx edi ebx
	dec	ecx
L1: 
	mov ebx,0
	push ecx
	mov	esi, edi
L2: 
	mov	eax,[esi]
	cmp	[esi+4],eax
	JGE L3  

	xchg eax,[esi+4]
	mov	[esi],eax
	inc ebx
L3: 
	add	esi,4
	loop L2
	pop	ecx
	cmp ebx,0
	JBE L4
	loop L1
L4: 
	ret
BubbleSort endp

end main