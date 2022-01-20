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
	add esi,4
	loop L1


	call time1
	;call wrst
	call time2
	;call wrst

	exit
main ENDP

copyArray2 PROC USES esi ecx edi
	mov esi,OFFSET source
	mov edi,OFFSET target
	mov ecx,ttk
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
	mov ecx,ttk
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

time1 PROC USES eax edx
	call GetMSeconds
	mov startTime,eax
	call copyArray
	call GetMSeconds
	sub eax, startTime
	mov edx, OFFSET msg
	call WriteString
	call WriteDEC
	call Crlf
	ret
time1 ENDP

time2 PROC USES eax edx
	call GetMSeconds
	mov startTime,eax
	call copyArray2
	call GetMSeconds
	sub eax, startTime
	mov edx, OFFSET msg
	call WriteString
	call WriteDEC
	call Crlf
	ret
time2 ENDP

end main