include irvine32.inc

.data
source dword 1234h,5678h,9123h
target dword 3 dup(?)
startTime dword ?
msg dword ?
.code
main proc
	call GetMSeconds
	mov startTime,eax
	call copyArray
	call GetMSeconds
	sub eax, startTime
	mov edx, OFFSET msg
	call WriteString
	call WriteDEC
	call Crlf
	call wrst
	call Crlf

	call GetMSeconds
	mov startTime,eax
	call copyArray2
	call GetMSeconds
	sub eax, startTime
	mov edx, OFFSET msg
	call WriteString
	call WriteDEC
	call Crlf
	call wrst

	exit
main ENDP

copyArray PROC USES esi ecx edi
	mov esi,OFFSET source
	mov edi,OFFSET target
	mov ecx,LENGTHOF source
L1:
	mov eax, [esi]
	mov [edi], eax
	add esi, 4
	add edi, 4
	loop L1
	ret
copyArray ENDP

copyArray2 PROC USES esi ecx edi
	cld
	mov esi,OFFSET source
	mov edi,OFFSET target
	mov ecx,LENGTHOF source
	rep movsd
	ret
copyArray2 ENDP

wrst PROC USES esi ecx eax
	mov esi, OFFSET target
	mov ecx, 3
L1:
	mov eax, [esi]
	call WriteHex
	call Crlf
	add esi, 4
	loop L1
	ret
wrst ENDP

end main