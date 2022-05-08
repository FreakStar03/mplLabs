Aim:- Write an assembly language program for 16 bit addition

In computer architecture, 16-bit integers, memory addresses, or other data units are those that are 16 bits (2 octets) wide

Performing Basic Addition of two 16 bit hexadecimal number:
```
eg. 4A6<16> + 1B3<16> = 659<16>

 1       carry
 4 A 6 = 1190<10>
+1 B 3 =  435<10>
-----------------
 6 5 9 = 1625<10>
```
In 16 bit number ,we have four hexadecimal number such as 3456H or A6B3H for the addition.


Code:
16 bit addition
```
# ORG 7000H
LHLD  7601          ;Get  1st no. in HL pair from memory 7601 H
XCHG                ;Exchange cont. of DE       HL
LHLD  7603          ;Get  2st no. in HL pair from location 7603 H
MVI C,00            ;Clear reg. C.
DAD D               ;Get HL+DE & store result in HL
JNC down            ;If no carry move to loop/if carry then move to next step.
INR C               ;Increment reg.C
MOV A,C             ;Move carry from reg. C to reg. A
STA 7502            ;Store carry at 7502 H
down: SHLD 7500     ;Store result in 7500 H.
RST 1               ;Terminate

#ORG 7601H                ;Store input at the address
#DB 13,31,12,10           ;Get two 16 bit no. in successive location

```
_flowchart_
- start
- load first 16 bit from LHLD
- exchange de and hl
- load 2nd pair
- clear c reg
- add hl and de and store in hl
- loop if c is 1
- yes ->
    - Increment c 
- no ->
    - load c reg in accumulator
    - store accumulator TO mem address
    - store hl pair to mem address

Code: ***not in sylabus***

8 bit addition
```
# ORG 7000H

LXI H,7501                 // Get address of 1st no. in HL pair
MOV A,M                 // Move no. into accumulator
INX H                 // HL points the address 7502 H
ADD M                 // Add the 2nd no.
INX   H                 // HL points 7503 H
MOV M,A               // Store result in 7503 H
RST 1                              // Terminate

# ORG 7501H                        // Store input at the address
# DB 12H, 13H                    // Get two 8 bit no. in successive location
```
