.MODEL SMALL
.STACK 100H
.DATA
N DB 34H, 67H, 89H, 12H, 55H, 90H, 0CH
COUNT DW 7      ;count decimal or constant number
LARGEST DB?     ;initialize largest variable
.CODE 
START:
MOV AX,@DATA    ;initialize data section
MOV DS,AX
MOV SI, 0       ;index register for taking every value one by one
MOV CX,COUNT
MOV BL,N[SI]
DEC CX 
AGAIN:
INC SI          ;increment the source index register
CMP BL, N[SI]   ;compare the value of BL and value in SI
JNC NOSWAP      ; Jump if carry flag is set to zero
MOV BL,N[SI]
NOSWAP:LOOP AGAIN
MOV LARGEST, BL ; The largest value will be stored in bl register
MOV AH,4CH
INT 21H
END START