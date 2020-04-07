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
	; Step 3: Push EBP
	push EBP
	; Step 4: Make EBP point to the current location pointed by ESP
	mov EBP,ESP
	; Step 5: Create space for local variables and initialize them
	; Allocate space for one scalar variable of type int (SDWORD) and
	; one array variable of type int with two elements 
	sub ESP,12
	; Initialize scalar local variable
	mov [EBP-4], SDWORD PTR 1
	; Initialize array local variable
	mov [EBP-8], SDWORD PTR 10
	mov [EBP-12], SDWORD PTR 11
	; Step 6: Save Registers 
	push eax
	push esi


	; Step 7: Implement the addition and store the result at
	;		  the given address in memory
	mov eax, [ebp+8]  ; Access first argument ( 5 )
	add eax, [ebp+12] ; Access second argument ( 6 ) and add it to the first 
	add eax, [ebp-4]  ; Add scalar local variable to the sum

	mov esi, [ebp+16] ; Store the result return address given by the 
					  ; third argument in ESI register
	mov [esi],eax	  ; Store the result at the given address in memory 


	; Step 8 : Clean Registers in the opposite sequence
	pop esi
	pop eax
	; Step 9 : Clean local variable if any
	mov esp,ebp
	; Step 10 : Restore Stack Frame Base Address for the caller 
	pop EBP
	; Step 11 (STDCALL Convention): Return to the caller and clean up 
	; the arguments. 3 arguments X 4 bytes each = 12 bytes  
	ret	3*4	 	
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
	; Step 2 : Call AddTwo procedure
	call AddTwo

	; Step 12:  Store the result to EAX and print it to the screen
	; Notice that res variable value has been updated through
	; the call to AddTwo procedure
	mov eax ,res
	call WriteInt
exit

main ENDP
END main
