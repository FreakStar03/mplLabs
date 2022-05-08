Aim:- Write an assembly language program to check whether a given string is a
palindrome or not.

A palindrome is a word, phrase, number, or other sequence of characters which reads the same backward or forward.
Allowances may be made for adjustments to capital letters, punctuation, and word dividers

The following is an inductive characterization of a palindrome string:
- the empty string is a palindrome;
- a string constituted only by a single character is a palindrome;
- a string c|s|d is a palindrome, if s is a palindrome and c is a character
equal to d;
- nothing else is a palindrome



MACROS
Macros are just like procedures, but not really. Macros look like procedures, but they exist only until your code is compiled, after compilation all macros are replaced with real instructions. If you declared a macro and never used it in your code, compiler will simply ignore it

```assembly
.model small
.data
              menu db 10d,13d,"              MENU"
	           db 10d,"1. Enter the String"
     		  db 10d,"2. Reverse String"
		  db 10d,"3. Palindrom"	
	          db 10d,"4. Exit"
             db 10d,"Enter your choice: $"

        m1 db 10d,"Enter String: $"             
        m3 db 10d,"Reversed String: $" 
       m4 db 10d,"string is palindrom: $" 
       m5 db 10d,"string is not palindrom: $" 
       
        string db 15 dup('$')
        string2 db 15 dup('$')
        len db 0000h

;***************MACRO**********************        
	print macro xx          ;general macro with 1 parameter
lea dx,xx
mov ah,09h
int 21h         ;call the kernel (interrupt)           
endm

.code
start:
        mov ax,@data
        mov ds,ax
        	  main: 
		print menu
        mov ah,01h      ;reads character from input and stores result in al
        int 21h

      cmp al,'4'
        je exit         ;if user enters 5 then it will jump to loop exit

        cmp al,'1'      
        je case1        ;if user enters 1 then it will jump to case1 and case1 is enter the string

       cmp al,'2'
       je case2

       cmp al,'3'
       je case3

;*********************CASES******************************* 
exit:
        mov ah,4Ch
        int 21h

case1: 
        print m1
        lea si,string
loop1:  
        mov ah,01h      ;reads the string which user had entered
        int 21h
        cmp al,0Dh      ;if it is line feed then go to skip otherwise move contents of si in al
        je skip1
	mov [si],al
        inc si
        inc len         ;increment character count
        jmp loop1
skip1:   
        mov al,24h      ;load MSB of count
        mov byte[si],al
jmp main

case2:      
        lea si,string
        lea di,string2
        mov cl,[len]
        mov ch,00
        add di,cx
        dec di                
loop2:  
        mov al,[si]
        mov [di],al
        inc si
        dec di
        loop loop2
        print m3
        print string2
jmp main
case3:
        lea si,string   ;string which user had entered 
        lea di,string2  ;reversed string is present in string2
        mov cl,[len]
loop3:  
        mov al,[si]
        mov bl,[di]
        inc si
        inc di
        cmp al,bl
        jne skip3
        loop loop3
        print m4
        jmp main
skip3: 
        print m5
jmp main
end start
```

