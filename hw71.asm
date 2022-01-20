include irvine32.inc

.data
array dword 4,7,9,33,5,22,63,41,21,55
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


BubbleSort proc uses eax ecx edi
	dec	ecx
L1: 
	push ecx
	mov	esi, edi
L2: 
	mov	eax,[esi]
	cmp	[esi+4],eax
	jge	L3

	xchg eax,[esi+4]
	mov	[esi],eax
L3: 
	add	esi,4
	loop L2

	pop	ecx
	loop L1
L4: 
	ret
BubbleSort endp

end main