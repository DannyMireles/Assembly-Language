.section .text
.globl lab02c 

lab02c:
       ADRP X3, hextable
       ADD X3,X3, :lo12:hextable
       ADRP X5, result
       ADD X5,X5, :lo12:result
       LSR X1, X0, 4       // get upper 4 bits - calculated 15/16 which rounds down to 0
       ADD X2, X1, X3          // get address in hextable + 4 so still the value in hextable
       LDURB W4, [X2,0]        // get character - loads first byte of hextable into W4
       STURB W4, [X5,0]        // first digit of the result - W4 gets stored in 1st byte of result, first byte in result is now what the first byte of hextable is
       AND  X1, X0, 0xf        // get lower 4 bits - ??
       ADD X2, X3, X1          // get address in hextable - adds X1 to address of hextable
       LDURB W4, [X2,0]        // get character - loading first byte of x2 into w4
       STURB W4, [X5,1]        // first digit of the result - storing w4 into second byte of result 
       BR X30

.section .data

hextable:
.asciz "0123456789abcdef"

msg1:
.asciz "Your number in Hex is: "

result:
.byte 2