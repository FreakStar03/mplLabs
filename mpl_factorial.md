Aim:- Write an assembly language program to find the factorial of a given number.


Example-
```
Input : 04H
Output : 18H
as In Decimal : 4*3*2*1 = 24
In Hexadecimal : 24 = 18H
```



Algorithm –
```
1. Input the Number whose factorial is to be find and Store that Number in CX Register
(Condition for LOOP Instruction)
2. Insert 0001 in AX(Condition for MUL Instruction) and 0000 in DX
3. Multiply CX with AX until CX become Zero(0) using LOOP Instruction
4. Copy the content of AX to memory location 0600
5. Copy the content of DX to memory location 0601
6. Stop Execution
```
Explanation-
```
1. MOV CX, [0500] loads 0500 Memory location content to CX Register
2. MOV AX, 0001 loads AX register with 0001
3. MOV DX, 0000 loads DX register with 0000
4. MUL CX multiply AX with CX and store result in DX:AX pair
5. LOOP 040A runs loop till CX not equal to Zero
6. MOV [0600], AX store AX register content to memory location 0600
7. MOV [0601], DX store DX register content to memory location 0601
8. HLT stops the execution of program
```

Code:
```
.MODEL SMALL
.STACK 100H
.DATA
N DB 5H

.CODE
START:
MOV AX,@DATA
MOV DS,AX
MOV CL,N
MOV AL,01
LOOP:
MUL C1
DEC C1
JNZ LOOP1
MOV AH,4CH
INT 21
END START
```