Aim:- Write an assembly language program to move a set of block from one
memory location to another.

Theory:-Takes the array elements from the user and also the number of elements
to be transferred. Block transfer here, refers to moving of block of data within the memory to a different location. In non-overlapped transfer we move the data to a completely new location. It is easily accomplished by copying the data using two
pointers, one data byte at a time.

Algorithm to copy data from one memory location to another:
```
Step I : Initialize the data memory with a set of data.
Step II : Load effective address of source and destination at SI and DI respectively.
Step III : Move the content of SI to AL ,then AL to DI
Step IV : Increment SI and DI
Step V : Start the loop to copy the string
Step VI : End of Program
```

code:
```
.MODEL SMALL
.STACK 100H
.DATA
SOU DB 10H,20H,30H,40H,50H
DES DB 5 DUP(?)

.CODE
START:
MOV AX,@DATA
MOV DS,AX
LEA SI,SOU
LEA DI,DES
MOV CX,05H
BACK: MOV AL,[SI]
	  MOV[DI],AL
	  INC SI
	  INC DI
LOOP BACK
EXIT:
MOV AH,4CH
INT 21H
END START
```


