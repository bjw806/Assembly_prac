include irvine32.inc

.data
source dword 1234h,5678h,9123h
target dword 3 dup (?)
.code
main proc
	cld
	mov esi,OFFSET source
	mov edi,OFFSET target
	mov ecx,LENGTHOF source
	rep movsd

	mov eax, source[0]
	call WriteHex
	call Crlf
	mov eax, source[4]
	call WriteHex
	call Crlf
	mov eax, source[8]
	call WriteHex
	call Crlf

	exit
main endp
end main