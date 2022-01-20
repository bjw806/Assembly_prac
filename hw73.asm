include irvine32.inc

.data
array dword 4,7,9,33,5,22,63,41,21,55
.code
main proc
	mov ecx,lengthof array
	mov esi,offset array
ll:
	push [esi]
	add esi,4
	loop ll
	;스택에 배열 넣기

	mov EDI,ebp
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
	mov ebp,edi
L2: 
	mov eax,[ebp-16]
	cmp [ebp-20],eax
	jge L3

	xchg eax,[ebp-20]
	mov [ebp-16],eax
L3: 
	sub ebp,4
	loop L2

	pop ecx
	loop L1
L4: 
	ret
BubbleSort endp

end main