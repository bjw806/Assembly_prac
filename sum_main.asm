include sum.inc

Count = 3
.data
prompt1 byte "Enter a signed integers: ",0
prompt2 byte "The sum of the integers is: ",0
array dword Count DUP(?)
sum dword ?
.code
main PROC
	call clrscr

	invoke PromptForIntegers,ADDR prompt1,ADDR array,Count
	invoke ArraySum,ADDR array,Count
	mov sum,eax
	invoke DisplaySum,ADDR prompt2,sum

	call Crlf
	exit
main ENDP
END main