.section .text
.globl lab02d

lab02d:
	ADD X0, X0, #1000 // X0 = 1000 + X0 
	ADRP X9, myvalue 
	ADD X9, X9, :lo12:myvalue // temporary register X9 holds address of myvalue
	STUR X0, [X9, #0] // store the value after adding 1000 into myvalue address
  ORR X0, X9, XZR // X0 gets the address of X9
  
  br X30 // return address stored in X30
  
.section	.data
myvalue: