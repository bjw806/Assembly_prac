include irvine32.inc
addmul Proto, x:dword, y:dword, z:dword
.data
var dword ?
.code
main proc
	mov var,10
	invoke addmul,var,3,4

	call WriteInt

	exit
main endp


addmul proc, x:dword, y:dword, z:dword
	mov eax,x
	mul y
	add eax,z
	ret
addmul endp

end main