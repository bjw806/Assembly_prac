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
	;���ÿ� �迭 �ֱ�
	;16���� -4��
	push ebp
	mov eax, [ebp-16];4
	call writedec
	call crlf
	mov ebp,esp
	mov eax, [esp+4];55
	mov eax, [ebp+4];55
	call writedec


	exit
main endp
end main