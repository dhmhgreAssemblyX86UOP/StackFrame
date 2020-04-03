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
;				 procedure equivalent in C language 
;			   	 void AddTwo(int a,int b, int*res)
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
;				procedure equivalent in C language 
;			   	void main()
;				and prints the result to the screen. 
; Input		  : - 
; Output	  : -
; **************************************************************
main PROC
	; Step 1 : Pass arguments to the stack
	; Arguments are pushed in the opposite sequence than 
	; the C language equivalent call of AddTwo(5,6,&res)
	push OFFSET res		; pass the address of res variable ( pass by reference)
	push 6
	push 5
exit

main ENDP
END main
