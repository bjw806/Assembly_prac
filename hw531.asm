include irvine32.inc

.data
var1 dword 4294967295,2,3,4294967295
var2 dword 2,12,13,4
result dword 5 dup (?)
.code
main proc
	mov esi,OFFSET var1
	mov edi,OFFSET var2
	mov ebx,OFFSET result
	mov ecx,4
	clc
L1:
	mov eax,[esi]
	adc eax,[edi]
	pushfd
	mov [ebx+16],eax
	add esi,4
	add edi,4
	sub ebx,4
	popfd
	loop L1

	adc word ptr[ebx+16],0
	mov ESI, 0
	mov ECX, 5
L2:
	mov EAX, result[ESI]
	call WriteHex
	add ESI, 4
	loop L2

	exit
main endp
end main