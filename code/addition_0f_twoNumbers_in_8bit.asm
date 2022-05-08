# ORG 7000H

LXI H,7501            ;Get address of 1st no. in HL pair
MOV A,M               ;Move no. into accumulator
INX H                 ;HL points the address 7502 H
ADD M                 ;Add the 2nd no.
INX   H               ;HL points 7503 H
MOV M,A               ;Store result in 7503 H
RST 1                 ;Terminate

# ORG 7501H                       // Store input at the address
# DB 12H, 13H                    // Get two 8 bit no. in successive location
