Aim: Write an assembly language program to convert Packed BCD to Unpacked BCD and also convert it into its ASCII value.


Theory:
BCD represents each of the digits of an unsigned decimal as the 4-bit binary equivalents


Unpacked BCD representation contains only one decimal digit per byte. The digit is stored in the least significant 4 bits; the most significant 4 bits are not relevant to the value of the represented number


Packed BCD representation packs two decimal digits into a single byte

decimal to bcd
To convert a decimal number into an unpacked BCD number, assign each decimal digit its 8-bit binary equivalent 

Algorithm to convert Packed BCD to unpacked BCD:
```
Step I   : Initialize the data memory.
Step II  : Load the number in AL.
Step III : Mask upper nibble by Anding with 0Fh.
Step IV  : Move the lower digit to number DI1
Step V   : Convert the lower digit to ASCII by adding 30h
Step VI  : Load the number into register AL again
Step VII : Mask the lower nibble by Anding with F0h.
Step VIII: Load the counter with 4
Step IX  : Rotate 4 times left to make MSB digit = LSB by using ROL.
Step X   : Move the upper digit to number DI2
Step XI  : Convert the upper digit to ASCII by adding 30h
```

```
.MODEL SMALL
.STACK 100H
.DATA
N1 DB 25H
DI1 DB ?
DI2 DB ?
A1 DB ?
A2 DB ?
.CODE
START:
MOV AX,@DATA
MOV DS,AX
MOV AL,N1
AND AL,0FH
MOV DI1,AL
ADD AL,30H      
MOV A1,AL
MOV BL,N1
AND BL,0F0H    
MOV CL,04H
ROL BL,CL        
MOV DI2,BL
ADD BL,30H
MOV A2,BL
EXIT:MOV AH,4CH
INT 21H
END START
```


