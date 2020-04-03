TITLE Illustrate Creation and_ Destruction of Activation Record_
INCLUDE Irvine32.inc

.data

; Declare a variable to return the value from the
; AddTwo procedure
res DWORD ?

; AddTwo procedure declaration
AddTwo PROTO

.code
; **************************************************************
; Procedure name : AddTwo
; Description : Adds two numbers and returns the sum
; Input		  : The first 2 arguments of the procedure are
;				the two addents 
; Output	  : The third argument is returned by reference to 
;				the caller
; **************************************************************
AddTwo PROC


	ret
AddTwo ENDP

; **************************************************************
; Procedure name : main ( Startup Function )
; Description : Calls the AddTwo procedure giving two numbers 
;				and prints the result to the screen. 
; Input		  : - 
; Output	  : -
; **************************************************************
main PROC


exit
main ENDP
END main
