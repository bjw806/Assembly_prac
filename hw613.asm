include irvine32.inc
ttk=100000
.data
source dword ttk dup(?)
target dword ttk dup(?)
startTime dword ?
msg dword ?
.code
main proc
	mov esi,OFFSET source
	mov ecx, ttk
L1:
	call Random32
	mov [esi],eax
	;mov eax,[esi]
	;call writehex
	;call crlf
	add esi,4
	loop L1

	;mov ecx,ttk
	;mov esi,OFFSET source
;L2:
	;mov eax, [esi]
	;call writehex
	;call Crlf
	;add esi,4
	;loop L2

	call time1
	;call wrst
	call time2
	;call wrst


	;call copyArray
	;call wrst
	


	exit
main ENDP

copyArray2 PROC USES esi ecx edi
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
copyArray2 ENDP

copyArray PROC USES esi ecx edi
	cld
	mov esi,OFFSET source
	mov edi,OFFSET target
	mov ecx,LENGTHOF source
	rep movsd
	ret
copyArray ENDP

wrst PROC USES esi ecx eax
	mov esi, OFFSET target
	mov edi,OFFSET target
	mov ecx,ttk
L1:
	mov eax, [esi]
	call WriteHex
	call Crlf
	add esi, 4
	loop L1

	ret
wrst ENDP

time1 PROC USES eax edx ecx
	mov ecx,ttk
	call GetMSeconds
	mov startTime,eax
L1:
	call copyArray
	loop L1
	call GetMSeconds
	sub eax, startTime
	mov edx, OFFSET msg
	call WriteString
	call WriteHex
	call Crlf
	ret
time1 ENDP

time2 PROC USES eax edx ecx
	mov ecx,ttk
	call GetMSeconds
	mov startTime,eax
L1:
	call copyArray2
	loop L1
	call GetMSeconds
	sub eax, startTime
	mov edx, OFFSET msg
	call WriteString
	call WriteHex
	call Crlf
	ret
time2 ENDP

end main