Aim:- Write an assembly language program to find the smallest/largest number from a given set of numbers.

Theory:-
In computer science, a selection algorithm is an algorithm for finding the kth smallest number in a list or array; such a number is called the kth order statistic. 
The simplest case of a selection algorithm is finding the minimum (or maximum) element by iterating through the list, keeping track of the running minimum – the minimum so far – (or maximum) and can be seen as related to the selection sort.


Algorithm to find largest number:
```
Step I : Initialize the data memory with an array of numbers
Step II : Declare the largest variable
Step III : Load the counter according to number of count.
Step IV : Move first value from array into BL
Step V : increment the source index register to take second number
Step VI : Compare both using CMP command
Step VII : Jump if carry flag is set to zero, means no swapping of numbers.
Step VIII : If carry flag is set, swap first number with second
Step IX : Repeat the loop again
Step X : Finally, BL stores the largest number
```

code:
```
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
```