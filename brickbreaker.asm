 .model small 
.stack 100h 
.data 

file_made dw 0
livil1 db "level:1",0
livil2 db "level:2",0
livil3 db "level:3",0
file db 'game.txt$',0
Filehandle dw ?

score1 db "score:1",0
score2 db "score:2",0
score3 db "score:3",0
score4 db "score:4",0
score5 db "score:5",0
score6 db "score:6",0
score7 db "score:7",0
score8 db "score:8",0
score9 db "score:9",0
score10 db "score:10",0
score11 db "score:11",0
score12 db "score:12",0
score13 db "score:13",0
score14 db "score:14",0
score15 db "score:15",0
score16 db "score:16",0
score17 db "score:17",0
score18 db "score:18",0
score19 db "score:19",0
score20 db "score:20",0
score21 db "score:21",0
score22 db "score:22",0
score23 db "score:23",0
score24 db "score:24",0



won dw 0
bonus dw 0
;hashir ka code 
 msgwon db "+***********congrats you won***********+", 10, "$"	; string


    msg1 db "+-------- Brick Breaker -----------+", 10, "$"	; string
	msg2 db "|     1) Level-1                   |", 10, "$"	; string
	msg3 db "|     2) Level-2                   |", 10, "$"	; string
	msg8 db "|     3) Level-3                   |", 10, "$"	; string
	msg7 db "|     4) Instructions              |", 10, "$"	; string
	msg9 db "|     5) Resume                    |", 10, "$"	; string
	msg6 db "|     6) Exit                      |", 10, "$"	; string
	msg4 db "+----------------------------------+", 10, "$"	; string
	msg5 db "Enter option please : $"; string
	msgInput db "Please Enter your name : $"	; string
    _name db 15 dup(?)				; string to input name of user


; _welcome db "THE BRICK BREAKER GAME" 
; _enter db "ENTER YOUR NAME UPTO 8 LETTERS"

Instructions db  "-Player moves a paddle from side to side to hit a BALL.", 13, 10

             db  "-Eliminate all of the BRICKS at the top of the screen by hitting them with the BALL.", 13, 10
			 
             db  "-If the ball hit the bottom ENCLOSURE, the player loses and the game ends!", 13, 10
			 
             db  "-All the BRICKS must be eliminated to win game.", 13, 10
			 
             db  "-The game is split into many levels, which must be completed in sequence.", 13, 10
			 
             db  "-A time limit of 4 minutes and the remaining time will be shown with the counter.", 13, 10
			
             db  "-The player will have a maximum of 3 lives.", 13, 10, "$"


gameName db "BRICK BREAKER" , '$'
inputStr db "Enter your name: ",'$'
buff        db  26        ;MAX NUMBER OF CHARACTERS ALLOWED (25).
            db  ?         ;NUMBER OF CHARACTERS ENTERED BY USER.
            db  26 dup(0) ;CHARACTERS ENTERED BY USER.


;hashir ka code ends
 sc db "score ", "$"	; 
;declaring the cordinates for the ballcheck 
x_cor dw 100
y_cor dw 100


;declaring the cordinates for bonus ball
x1_cor dw 50
y1_cor dw 50

;time variable to store prev time 
FPS db 0
;spped of ball aong x and y axis 
spd_x dw 05h 
spd_y dw 05h

spd_x2 dw 05h 
spd_y2 dw 05h
;boundaries of console
bound_y dw 0C8h 
bound_x dw 12Ch
;bar position 
bar_x dw 100
bar_y dw 175
;bar dimension 
bar_w dw 50
bar_h dw 02h

lvl dw 1
game_over db 'GAME KHATAM SHUDD','$'
no_play db 'GAME KHATAM SHUDD','$'
play_again db 'TO PLAY AGAIN PRESS R','$'
;check if score exceeded 10 

exc dw 0

;life
life dw 3



;scores 
points dw 0



;ball touched brick 
brick1_t dw 0
brick2_t dw 0
brick3_t dw 0
brick4_t dw 0
brick5_t dw 0
brick6_t dw 0

brick7_t dw 0
brick8_t dw 0
brick9_t dw 0
brick10_t dw 0
brick11_t dw 0
brick12_t dw 0

brick13_t dw 0
brick14_t dw 0
brick15_t dw 0
brick16_t dw 0
brick17_t dw 0
brick18_t dw 0

brick19_t dw 0
brick20_t dw 0
brick21_t dw 0
brick22_t dw 0
brick23_t dw 0
brick24_t dw 0
;bricks starting point 

brick_x dw 50
brick_y dw 50
brick_x2 dw 80
brick_y2 dw 50
brick_x3 dw 110
brick_y3 dw 50
brick_x4 dw 140
brick_y4 dw 50
brick_x5 dw 170
brick_y5 dw 50
brick_x6 dw 200
brick_y6 dw 50

;second row

brick_x7 dw 50
brick_y7 dw 70
brick_x8 dw 80
brick_y8 dw 70
brick_x9 dw 110
brick_y9 dw 70
brick_x10 dw 140
brick_y10 dw 70
brick_x11 dw 170
brick_y11 dw 70
brick_x12 dw 200
brick_y12 dw 70

;third row 
brick_x13 dw 50
brick_y13 dw 90
brick_x14 dw 80
brick_y14 dw 90
brick_x15 dw 110
brick_y15 dw 90
brick_x16 dw 140
brick_y16 dw 90
brick_x17 dw 170
brick_y17 dw 90
brick_x18 dw 200
brick_y18 dw 90

;fourth row 
brick_x19 dw 50
brick_y19 dw 110
brick_x20 dw 80
brick_y20 dw 110
brick_x21 dw 110
brick_y21 dw 110
brick_x22 dw 140
brick_y22 dw 110
brick_x23 dw 170
brick_y23 dw 110
brick_x24 dw 200
brick_y24 dw 110



.code 
MIGHTY_GAME:
mov ax,@data 
mov ds,ax
mov ax,0 
mov points,0
mov brick1_t ,0
mov brick2_t ,0
mov brick3_t ,0
mov brick4_t ,0
mov brick5_t ,0
mov brick6_t ,0

mov brick7_t ,0
mov brick8_t ,0
mov brick9_t ,0
mov brick10_t, 0
mov brick11_t, 0
mov brick12_t, 0

mov brick13_t, 0
mov brick14_t, 0
mov brick15_t, 0
mov brick16_t, 0
mov brick17_t, 0
mov brick18_t, 0

mov brick19_t, 0
mov brick20_t, 0
mov brick21_t, 0
mov brick22_t, 0
mov brick23_t, 0
mov brick24_t, 0


main PROC 
mov ah,00h ;conf video mode 
mov al,13h ;video mode 
int 10h 

call inputName
call cls
call mainMenu


;background
mov ah,0Bh
mov bh,3
mov bx,3
mov bl,3;bak ground color 
int 21h 

FPS_thing:






;we need to move the ball for which we call ah 2ch which gives system time 
mov ah,2Ch
int 21h ;dl will have the 1/100 of sec 
;check if time passed
cmp FPS,dl ;if not equal update time and  if equal check again 
jne update_time
jmp FPS_thing
update_time:
mov FPS,dl


call cLs
call ball_change

call ball

.IF bonus!=0 && lvl==3
call ball2
call ball2_change
.ENDIF


call  bar_mov
call bar
call score




call heart



call brick1

call brick2
call brick3
call brick4
call brick5
call brick6

call brick7
call brick8
call brick9
call brick10
call brick11
call brick12
call brick13
call brick14
call brick15
call brick16
call brick17
call brick18
call brick19
call brick20
call brick21
call brick22
call brick23
call brick24

 



 .IF won>=22 && lvl==1
 call level2
 call allzero
 jmp FPS_thing
.ENDIF

 .IF won>=22 && lvl==2
 call level3
 call allzero
 jmp FPS_thing
.ENDIF
 .IF won>=22 && lvl==3
 call winsc
.ENDIF


cmp life,0
je gameOver
jmp FPS_thing

jmp EXIT
main ENDP


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;print the bricks	
;special brick ;
brick1 proc	


.IF lvl==3 && brick1_t>= 1
add brick20_t,3
add brick15_t,3
add brick9_t,3
add brick6_t,3
add brick3_t,3

.ENDIF

mov ax,lvl
.IF brick1_t>= 1
 jmp ee1
.ENDIF

mov dx,brick_x 							 	   		 ;
mov cx,brick_y							   			 ;
											   		 ;
;to make ball big we print pixel on five values 	 ;
;first verticall print 4 times  			   		 ;
;nested loop ha aik kisam ka 						 ;
													 ;
br:										   			 ;
mov ah,0Ch ;writing a pixell 			 	   		 ;
mov al,7; choosing color of the pixel  	   		 ;
mov bh,00h; page 						 	   		 ;
int 10h										   		 ;
inc dx										   		 ;
mov ax,dx								   			 ;
sub ax,brick_y 									   	 ;
cmp ax,10								   			 ;
jne br								   				 ;
;reset the value to start 				   			 ;
mov dx,brick_y								   		 ;
inc cx									   			 ;
mov ax,cx								   			 ;
sub ax,brick_x 									   	 ;
cmp ax,30								   			 ;
jne br	

ee1:
ret													 ;
brick1 endp											 ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
brick2 PROC   
mov ax,lvl
.IF brick2_t>= ax
 jmp ee2
.ENDIF;
;starting point of ball 					    	 ;
mov dx,brick_y2						 	        	 ;
mov cx,brick_x2								    	 ;
											    	 ;
;to make ball big we print pixel on five values  	 ;
;first verticall print 4 times  			    	 ;
;nested loop ha aik kisam ka 				    	 ;
ver2:										    	 ;
mov ah,0Ch ;writing a pixell 			 	    	 ;
mov al,12; choosing color of the pixel  	    	 ;
mov bh,00h; page 						 	    	 ;
int 10h		;								    	 ;
inc dx										    	 ;
mov ax,dx									    	 ;
sub ax,brick_y2								    	 ;
cmp ax,10									    	 ;
jne ver2									         ;
;reset the value to start 					    	 ;
mov dx,brick_y2								    	 ;
inc cx										    	 ;
mov ax,cx									    	 ;
sub ax,brick_x2								    	 ;
cmp ax,30									    	 ;
jne ver2	

ee2:;
ret													 ;
brick2 ENDP											 ;
													 ;
													 ;
													 ;
													 ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
brick3 PROC            
mov ax,lvl
.IF brick3_t>= ax
 jmp oro
.ENDIF;
;starting point of ball 					    	 ;
mov dx,brick_y3						 	        	 ;
mov cx,brick_x3								    	 ;
											    	 ;
;to make ball big we print pixel on five values  	 ;
;first verticall print 4 times  			    	 ;
;nested loop ha aik kisam ka 				    	 ;
ver3:										    	 ;
mov ah,0Ch ;writing a pixell 			 	    	 ;
mov al,6; choosing color of the pixel  	    	 ;
mov bh,00h; page 						 	    	 ;
int 10h		;								    	 ;
inc dx										    	 ;
mov ax,dx									    	 ;
sub ax,brick_y3								    	 ;
cmp ax,10									    	 ;
jne ver3									         ;
;reset the value to start 					    	 ;
mov dx,brick_y3								    	 ;
inc cx										    	 ;
mov ax,cx									    	 ;
sub ax,brick_x3								    	 ;
cmp ax,30									    	 ;
jne ver3	

oro:
ret													 ;
brick3 ENDP											 ;
													 ;
													 ;
													 ;
													 ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
brick4 PROC                                    		 ;
;starting point of ball 

mov ax,lvl
.IF brick4_t>= ax
 jmp ee4
.ENDIF
mov dx,brick_y4						 	        	 ;
mov cx,brick_x4								    	 ;
											    	 ;
;to make ball big we print pixel on five values  	 ;
;first verticall print 4 times  			    	 ;
;nested loop ha aik kisam ka 				    	 ;
ver4:										    	 ;
mov ah,0Ch ;writing a pixell 			 	    	 ;
mov al,7; choosing color of the pixel  	    	 ;
mov bh,00h; page 						 	    	 ;
int 10h		;								    	 ;
inc dx										    	 ;
mov ax,dx									    	 ;
sub ax,brick_y4								    	 ;
cmp ax,10									    	 ;
jne ver4									         ;
;reset the value to start 					    	 ;
mov dx,brick_y4								    	 ;
inc cx										    	 ;
mov ax,cx									    	 ;
sub ax,brick_x4								    	 ;
cmp ax,30									    	 ;
jne ver4
ee4:
ret													 ;
brick4 ENDP											 ;
													 ;
													 ;
													 ;
													 ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
brick5 PROC 

mov ax,lvl
.IF brick5_t>= ax
 jmp oho
.ENDIF
;starting point of ball 					    	 ;
mov dx,brick_y5						 	        	 ;
mov cx,brick_x5								    	 ;
											    	 ;
;to make ball big we print pixel on five values  	 ;
;first verticall print 4 times  			    	 ;
;nested loop ha aik kisam ka 				    	 ;
ver5:										    	 ;
mov ah,0Ch ;writing a pixell 			 	    	 ;
mov al,3; choosing color of the pixel  	    	 ;
mov bh,00h; page 						 	    	 ;
int 10h		;								    	 ;
inc dx										    	 ;
mov ax,dx									    	 ;
sub ax,brick_y5								    	 ;
cmp ax,10									    	 ;
jne ver5									         ;
;reset the value to start 					    	 ;
mov dx,brick_y5								    	 ;
inc cx										    	 ;
mov ax,cx									    	 ;
sub ax,brick_x5								    	 ;
cmp ax,30									    	 ;
jne ver5
oho:
ret													 ;
brick5 ENDP											 ;
													 ;
													 ;
													 ;
													 ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
brick6 PROC  

mov ax,lvl
.IF brick6_t>= ax
 jmp ee6
.ENDIF
;starting point of ball 					    	 ;
mov dx,brick_y6						 	        	 ;
mov cx,brick_x6								    	 ;
											    	 ;
;to make ball big we print pixel on five values  	 ;
;first verticall print 4 times  			    	 ;
;nested loop ha aik kisam ka 				    	 ;
ver6:										    	 ;
mov ah,0Ch ;writing a pixell 			 	    	 ;
mov al,1; choosing color of the pixel  	    	 ;
mov bh,00h; page 						 	    	 ;
int 10h		;								    	 ;
inc dx										    	 ;
mov ax,dx									    	 ;
sub ax,brick_y6								    	 ;
cmp ax,10									    	 ;
jne ver6									         ;
;reset the value to start 					    	 ;
mov dx,brick_y6								    	 ;
inc cx										    	 ;
mov ax,cx									    	 ;
sub ax,brick_x6								    	 ;
cmp ax,30								    	     ;
jne ver6
ee6:
ret													 ;
brick6 ENDP											 ;
													 ;
													 ;
													 ;
													 ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;
;second row 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
brick7 PROC  

mov ax,lvl
.IF brick7_t>= ax
 jmp ee7
.ENDIF

;starting point of ball 					    	 ;
mov dx,brick_y7						 	        	 ;
mov cx,brick_x7								    	 ;
											    	 ;
;to make ball big we print pixel on five values  	 ;
;first verticall print 4 times  			    	 ;
;nested loop ha aik kisam ka 				    	 ;
ver7:										    	 ;
mov ah,0Ch ;writing a pixell 			 	    	 ;
mov al,2; choosing color of the pixel  	    	 ;
mov bh,00h; page 						 	    	 ;
int 10h		;								    	 ;
inc dx										    	 ;
mov ax,dx									    	 ;
sub ax,brick_y7								    	 ;
cmp ax,10									    	 ;
jne ver7									         ;
;reset the value to start 					    	 ;
mov dx,brick_y7								    	 ;
inc cx										    	 ;
mov ax,cx									    	 ;
sub ax,brick_x7								    	 ;
cmp ax,30								    	     ;
jne ver7
ee7:
ret													 ;
brick7 ENDP											 ;
													 ;
													 ;
													 ;
													 ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
brick8 PROC  

mov ax,lvl
.IF brick8_t>= ax
 jmp ee8
.ENDIF
;starting point of ball 					    	 ;
mov dx,brick_y8						 	        	 ;
mov cx,brick_x8								    	 ;
											    	 ;
;to make ball big we print pixel on five values  	 ;
;first verticall print 4 times  			    	 ;
;nested loop ha aik kisam ka 				    	 ;
ver8:										    	 ;
mov ah,0Ch ;writing a pixell 			 	    	 ;
mov al,4; choosing color of the pixel  	    	 ;
mov bh,00h; page 						 	    	 ;
int 10h		;								    	 ;
inc dx										    	 ;
mov ax,dx									    	 ;
sub ax,brick_y8								    	 ;
cmp ax,10									    	 ;
jne ver8									         ;
;reset the value to start 					    	 ;
mov dx,brick_y8								    	 ;
inc cx										    	 ;
mov ax,cx									    	 ;
sub ax,brick_x8								    	 ;
cmp ax,30								    	     ;
jne ver8
ee8:
ret													 ;
brick8 ENDP											 ;
													 ;
													 ;
													 ;
													 ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


brick9 PROC  

mov ax,lvl
.IF brick9_t>= ax
 jmp ee9
.ENDIF
;starting point of ball 					    	 ;
mov dx,brick_y9						 	        	 ;
mov cx,brick_x9								    	 ;
											    	 ;
;to make ball big we print pixel on five values  	 ;
;first verticall print 4 times  			    	 ;
;nested loop ha aik kisam ka 				    	 ;
ver9:										    	 ;
mov ah,0Ch ;writing a pixell 			 	    	 ;
mov al,6; choosing color of the pixel  	    	 ;
mov bh,00h; page 						 	    	 ;
int 10h		;								    	 ;
inc dx										    	 ;
mov ax,dx									    	 ;
sub ax,brick_y9								    	 ;
cmp ax,10									    	 ;
jne ver9									         ;
;reset the value to start 					    	 ;
mov dx,brick_y9								    	 ;
inc cx										    	 ;
mov ax,cx									    	 ;
sub ax,brick_x9								    	 ;
cmp ax,30								    	     ;
jne ver9
ee9:
ret													 ;
brick9 ENDP											 ;
													 ;
													 ;
													 ;
													 ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

brick10 PROC  

mov ax,lvl
.IF brick10_t>= ax
 jmp ee10
.ENDIF

;starting point of ball 					    	 ;
mov dx,brick_y10						 	        	 ;
mov cx,brick_x10								    	 ;
											    	 ;
;to make ball big we print pixel on five values  	 ;
;first verticall print 4 times  			    	 ;
;nested loop ha aik kisam ka 				    	 ;
ver10:										    	 ;
mov ah,0Ch ;writing a pixell 			 	    	 ;
mov al,5; choosing color of the pixel  	    	 ;
mov bh,00h; page 						 	    	 ;
int 10h		;								    	 ;
inc dx										    	 ;
mov ax,dx									    	 ;
sub ax,brick_y10								    	 ;
cmp ax,10									    	 ;
jne ver10									         ;
;reset the value to start 					    	 ;
mov dx,brick_y10								    	 ;
inc cx										    	 ;
mov ax,cx									    	 ;
sub ax,brick_x10								    	 ;
cmp ax,30								    	     ;
jne ver10
ee10:
ret													 ;
brick10 ENDP											 ;
													 ;
													 ;
													 ;
													 ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

brick11 PROC  

mov ax,lvl
.IF brick11_t>= ax
 jmp ee11
.ENDIF

;starting point of ball 					    	 ;
mov dx,brick_y11						 	        	 ;
mov cx,brick_x11								    	 ;
											    	 ;
;to make ball big we print pixel on five values  	 ;
;first verticall print 4 times  			    	 ;
;nested loop ha aik kisam ka 				    	 ;
ver11:										    	 ;
mov ah,0Ch ;writing a pixell 			 	    	 ;
mov al,4; choosing color of the pixel  	    	 ;
mov bh,00h; page 						 	    	 ;
int 10h		;								    	 ;
inc dx										    	 ;
mov ax,dx									    	 ;
sub ax,brick_y11								    	 ;
cmp ax,10									    	 ;
jne ver11									         ;
;reset the value to start 					    	 ;
mov dx,brick_y11								    	 ;
inc cx										    	 ;
mov ax,cx									    	 ;
sub ax,brick_x11								    	 ;
cmp ax,30								    	     ;
jne ver11
ee11:
ret													 ;
brick11 ENDP											 ;
													 ;
													 ;
													 ;
													 ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

brick12 PROC  

mov ax,lvl
.IF brick12_t>= ax
 jmp ee12
.ENDIF

;starting point of ball 					    	 ;
mov dx,brick_y12						 	        	 ;
mov cx,brick_x12							    	 ;
											    	 ;
;to make ball big we print pixel on five values  	 ;
;first verticall print 4 times  			    	 ;
;nested loop ha aik kisam ka 				    	 ;
ver12:										    	 ;
mov ah,0Ch ;writing a pixell 			 	    	 ;
mov al,6; choosing color of the pixel  	    	 ;
mov bh,00h; page 						 	    	 ;
int 10h		;								    	 ;
inc dx										    	 ;
mov ax,dx									    	 ;
sub ax,brick_y12								    	 ;
cmp ax,10									    	 ;
jne ver12									         ;
;reset the value to start 					    	 ;
mov dx,brick_y12								    	 ;
inc cx										    	 ;
mov ax,cx									    	 ;
sub ax,brick_x12								    	 ;
cmp ax,30								    	     ;
jne ver12
ee12:
ret													 ;
brick12 ENDP											 ;
													 ;
													 ;
													 ;
													 ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;third row 


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
brick13 PROC

mov ax,lvl
.IF brick13_t>= ax
 jmp ee13
.ENDIF


;starting point of ball 					    	 ;
mov dx,brick_y13						 	        	 ;
mov cx,brick_x13								    	 ;
											    	 ;
;to make ball big we print pixel on five values  	 ;
;first verticall print 4 times  			    	 ;
;nested loop ha aik kisam ka 				    	 ;
ver13:										    	 ;
mov ah,0Ch ;writing a pixell 			 	    	 ;
mov al,5; choosing color of the pixel  	    	 ;
mov bh,00h; page 						 	    	 ;
int 10h		;								    	 ;
inc dx										    	 ;
mov ax,dx									    	 ;
sub ax,brick_y13								    	 ;
cmp ax,10									    	 ;
jne ver13									         ;
;reset the value to start 					    	 ;
mov dx,brick_y13								    	 ;
inc cx										    	 ;
mov ax,cx									    	 ;
sub ax,brick_x13							    	 ;
cmp ax,30								    	     ;
jne ver13
ee13:
ret													 ;
brick13 ENDP											 ;
													 ;
													 ;
													 ;
													 ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
brick14 PROC  

mov ax,lvl
.IF brick14_t>= ax
 jmp ee14
.ENDIF

;starting point of ball 					    	 ;
mov dx,brick_y14						 	        	 ;
mov cx,brick_x14							    	 ;
											    	 ;
;to make ball big we print pixel on five values  	 ;
;first verticall print 4 times  			    	 ;
;nested loop ha aik kisam ka 				    	 ;
ver14:										    	 ;
mov ah,0Ch ;writing a pixell 			 	    	 ;
mov al,8; choosing color of the pixel  	    	 ;
mov bh,00h; page 						 	    	 ;
int 10h		;								    	 ;
inc dx										    	 ;
mov ax,dx									    	 ;
sub ax,brick_y14								    	 ;
cmp ax,10									    	 ;
jne ver14									         ;
;reset the value to start 					    	 ;
mov dx,brick_y14								    	 ;
inc cx										    	 ;
mov ax,cx									    	 ;
sub ax,brick_x14								    	 ;
cmp ax,30								    	     ;
jne ver14
ee14:
ret													 ;
brick14 ENDP											 ;
													 ;
													 ;
													 ;
													 ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


brick15 PROC  

mov ax,lvl
.IF brick15_t>= ax
 jmp ee15
.ENDIF

;starting point of ball 					    	 ;
mov dx,brick_y15						 	        	 ;
mov cx,brick_x15								    	 ;
											    	 ;
;to make ball big we print pixel on five values  	 ;
;first verticall print 4 times  			    	 ;
;nested loop ha aik kisam ka 				    	 ;
ver15:										    	 ;
mov ah,0Ch ;writing a pixell 			 	    	 ;
mov al,3; choosing color of the pixel  	    	 ;
mov bh,00h; page 						 	    	 ;
int 10h		;								    	 ;
inc dx										    	 ;
mov ax,dx									    	 ;
sub ax,brick_y15								    	 ;
cmp ax,10									    	 ;
jne ver15									         ;
;reset the value to start 					    	 ;
mov dx,brick_y15								    	 ;
inc cx										    	 ;
mov ax,cx									    	 ;
sub ax,brick_x15							    	 ;
cmp ax,30								    	     ;
jne ver15
ee15:
ret													 ;
brick15 ENDP											 ;
													 ;
													 ;
													 ;
													 ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

brick16 PROC  
mov ax,lvl
.IF brick16_t>= ax
 jmp ee16
.ENDIF


;starting point of ball 					    	 ;
mov dx,brick_y16						 	        	 ;
mov cx,brick_x16								    	 ;
											    	 ;
;to make ball big we print pixel on five values  	 ;
;first verticall print 4 times  			    	 ;
;nested loop ha aik kisam ka 				    	 ;
ver16:										    	 ;
mov ah,0Ch ;writing a pixell 			 	    	 ;
mov al,3; choosing color of the pixel  	    	 ;
mov bh,00h; page 						 	    	 ;
int 10h		;								    	 ;
inc dx										    	 ;
mov ax,dx									    	 ;
sub ax,brick_y16								    	 ;
cmp ax,10									    	 ;
jne ver16									         ;
;reset the value to start 					    	 ;
mov dx,brick_y16								    	 ;
inc cx										    	 ;
mov ax,cx									    	 ;
sub ax,brick_x16								    	 ;
cmp ax,30								    	     ;
jne ver16
ee16:
ret													 ;
brick16 ENDP											 ;
													 ;
													 ;
													 ;
													 ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

brick17 PROC  
mov ax,lvl
.IF brick17_t>= ax
 jmp ee17
.ENDIF

;starting point of ball 					    	 ;
mov dx,brick_y17						 	        	 ;
mov cx,brick_x17								    	 ;
											    	 ;
;to make ball big we print pixel on five values  	 ;
;first verticall print 4 times  			    	 ;
;nested loop ha aik kisam ka 				    	 ;
ver17:										    	 ;
mov ah,0Ch ;writing a pixell 			 	    	 ;
mov al,6; choosing color of the pixel  	    	 ;
mov bh,00h; page 						 	    	 ;
int 10h		;								    	 ;
inc dx										    	 ;
mov ax,dx									    	 ;
sub ax,brick_y17								    	 ;
cmp ax,10									    	 ;
jne ver17									         ;
;reset the value to start 					    	 ;
mov dx,brick_y17								    	 ;
inc cx										    	 ;
mov ax,cx									    	 ;
sub ax,brick_x17								    	 ;
cmp ax,30								    	     ;
jne ver17
ee17:
ret													 ;
brick17 ENDP											 ;
													 ;
													 ;
													 ;
													 ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

brick18 PROC  

mov ax,lvl
.IF brick18_t>= ax
 jmp ee18
.ENDIF

;starting point of ball 					    	 ;
mov dx,brick_y18						 	        	 ;
mov cx,brick_x18							    	 ;
											    	 ;
;to make ball big we print pixel on five values  	 ;
;first verticall print 4 times  			    	 ;
;nested loop ha aik kisam ka 				    	 ;
ver18:										    	 ;
mov ah,0Ch ;writing a pixell 			 	    	 ;
mov al,9; choosing color of the pixel  	    	 ;
mov bh,00h; page 						 	    	 ;
int 10h		;								    	 ;
inc dx										    	 ;
mov ax,dx									    	 ;
sub ax,brick_y18								    	 ;
cmp ax,10									    	 ;
jne ver18									         ;
;reset the value to start 					    	 ;
mov dx,brick_y18								    	 ;
inc cx										    	 ;
mov ax,cx									    	 ;
sub ax,brick_x18								    	 ;
cmp ax,30								    	     ;
jne ver18

ee18:
ret													 ;
brick18 ENDP											 ;
													 ;
													 ;
													 ;
													 ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;fouth row 


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
brick19 PROC  

mov ax,lvl
.IF brick19_t>= ax
 jmp ee19
.ENDIF

;starting point of ball 					    	 ;
mov dx,brick_y19						 	        	 ;
mov cx,brick_x19								    	 ;
											    	 ;
;to make ball big we print pixel on five values  	 ;
;first verticall print 4 times  			    	 ;
;nested loop ha aik kisam ka 				    	 ;
ver19:										    	 ;
mov ah,0Ch ;writing a pixell 			 	    	 ;
mov al,7; choosing color of the pixel  	    	 ;
mov bh,00h; page 						 	    	 ;
int 10h		;								    	 ;
inc dx										    	 ;
mov ax,dx									    	 ;
sub ax,brick_y19								    	 ;
cmp ax,10									    	 ;
jne ver19									         ;
;reset the value to start 					    	 ;
mov dx,brick_y19								    	 ;
inc cx										    	 ;
mov ax,cx									    	 ;
sub ax,brick_x19							    	 ;
cmp ax,30								    	     ;
jne ver19
ee19:
ret													 ;
brick19 ENDP											 ;
													 ;
													 ;
													 ;
													 ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
brick20 PROC 
mov ax,lvl
.IF brick20_t>= ax
 jmp ee20
.ENDIF
;starting point of ball 					    	 ;
mov dx,brick_y20						 	        	 ;
mov cx,brick_x20							    	 ;
											    	 ;
;to make ball big we print pixel on five values  	 ;
;first verticall print 4 times  			    	 ;
;nested loop ha aik kisam ka 				    	 ;
ver20:										    	 ;
mov ah,0Ch ;writing a pixell 			 	    	 ;
mov al,4; choosing color of the pixel  	    	 ;
mov bh,00h; page 						 	    	 ;
int 10h		;								    	 ;
inc dx										    	 ;
mov ax,dx									    	 ;
sub ax,brick_y20								    	 ;
cmp ax,10									    	 ;
jne ver20									         ;
;reset the value to start 					    	 ;
mov dx,brick_y20								    	 ;
inc cx										    	 ;
mov ax,cx									    	 ;
sub ax,brick_x20								    	 ;
cmp ax,30								    	     ;
jne ver20
ee20:
ret													 ;
brick20 ENDP											 ;
													 ;
													 ;
													 ;
													 ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


brick21 PROC 
mov ax,lvl
.IF brick21_t>= ax
 jmp ee21
.ENDIF

;starting point of ball 					    	 ;
mov dx,brick_y21						 	        	 ;
mov cx,brick_x21								    	 ;
											    	 ;
;to make ball big we print pixel on five values  	 ;
;first verticall print 4 times  			    	 ;
;nested loop ha aik kisam ka 				    	 ;
ver21:										    	 ;
mov ah,0Ch ;writing a pixell 			 	    	 ;
mov al,12; choosing color of the pixel  	    	 ;
mov bh,00h; page 						 	    	 ;
int 10h		;								    	 ;
inc dx										    	 ;
mov ax,dx									    	 ;
sub ax,brick_y21								    	 ;
cmp ax,10									    	 ;
jne ver21									         ;
;reset the value to start 					    	 ;
mov dx,brick_y21								    	 ;
inc cx										    	 ;
mov ax,cx									    	 ;
sub ax,brick_x21							    	 ;
cmp ax,30								    	     ;
jne ver21
ee21:
ret													 ;
brick21 ENDP											 ;
													 ;
													 ;
													 ;
													 ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

brick22 PROC  
mov ax,lvl
.IF brick22_t>= ax
 jmp ee22
.ENDIF

;starting point of ball 					    	 ;
mov dx,brick_y22						 	        	 ;
mov cx,brick_x22								    	 ;
											    	 ;
;to make ball big we print pixel on five values  	 ;
;first verticall print 4 times  			    	 ;
;nested loop ha aik kisam ka 				    	 ;
ver22:										    	 ;
mov ah,0Ch ;writing a pixell 			 	    	 ;
mov al,19; choosing color of the pixel  	    	 ;
mov bh,00h; page 						 	    	 ;
int 10h		;								    	 ;
inc dx										    	 ;
mov ax,dx									    	 ;
sub ax,brick_y22								    	 ;
cmp ax,10									    	 ;
jne ver22									         ;
;reset the value to start 					    	 ;
mov dx,brick_y22								    	 ;
inc cx										    	 ;
mov ax,cx									    	 ;
sub ax,brick_x22								    	 ;
cmp ax,30								    	     ;
jne ver22
ee22:
ret													 ;
brick22 ENDP											 ;
													 ;
													 ;
													 ;
													 ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

brick23 PROC  

mov ax,lvl
.IF brick23_t>= ax
 jmp ee23
.ENDIF
;starting point of ball 					    	 ;
mov dx,brick_y23						 	        	 ;
mov cx,brick_x23								    	 ;
											    	 ;
;to make ball big we print pixel on five values  	 ;
;first verticall print 4 times  			    	 ;
;nested loop ha aik kisam ka 				    	 ;
ver23:										    	 ;
mov ah,0Ch ;writing a pixell 			 	    	 ;
mov al,6; choosing color of the pixel  	    	 ;
mov bh,00h; page 						 	    	 ;
int 10h		;								    	 ;
inc dx										    	 ;
mov ax,dx									    	 ;
sub ax,brick_y23								    	 ;
cmp ax,10									    	 ;
jne ver23									         ;
;reset the value to start 					    	 ;
mov dx,brick_y23								    	 ;
inc cx										    	 ;
mov ax,cx									    	 ;
sub ax,brick_x23								    	 ;
cmp ax,30								    	     ;
jne ver23
ee23:
ret													 ;
brick23 ENDP											 ;
													 ;
													 ;
													 ;
													 ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

brick24 PROC  
mov ax,lvl
.IF brick24_t>= ax
 jmp ee24
.ENDIF
;starting point of ball 					    	 ;
mov dx,brick_y24						 	        	 ;
mov cx,brick_x24							    	 ;
											    	 ;
;to make ball big we print pixel on five values  	 ;
;first verticall print 4 times  			    	 ;
;nested loop ha aik kisam ka 				    	 ;
ver24:										    	 ;
mov ah,0Ch ;writing a pixell 			 	    	 ;
mov al,8; choosing color of the pixel  	    	 ;
mov bh,00h; page 						 	    	 ;
int 10h		;								    	 ;
inc dx										    	 ;
mov ax,dx									    	 ;
sub ax,brick_y24								    	 ;
cmp ax,10									    	 ;
jne ver24									         ;
;reset the value to start 					    	 ;
mov dx,brick_y24								    	 ;
inc cx										    	 ;
mov ax,cx									    	 ;
sub ax,brick_x24								    	 ;
cmp ax,30								    	     ;
jne ver24

ee24:
ret													 ;
brick24 ENDP											 ;
													 ;
													 ;
													 ;
													 ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ball_change PROC												;
;draw ball at diff place 										;
;update the values of cordinates 								;
;move ball 														;
																;
																;
																;
mov ax,spd_y													;
add y_cor,ax													;
cmp y_cor,010h ;if lower boundry crossed						;
JNL  skip1  													;
neg spd_y														;
skip1:															;
cmp y_cor,0BEh ;if upper boundry crossed						;
JNG skip2														;
;add x_cor,0A0h													;
sub y_cor,64h
dec life
																;
skip2:															;
mov ax,spd_x													;
add x_cor,ax													;
cmp x_cor,010h ;if left boundry crossed							;
JNL  skip3  													;
neg spd_x														;
skip3:															;
cmp x_cor,12Ch ;if righhht boundry crossed						;
JNG skip4														;
neg spd_x														;
;draw ball in every 1/100 of sec								;
skip4:															;
;check if ball id colilidin gwith the paddle 					;
;cor_y+3 >= bar_y && cor_x>=bar_x && cor_x+3<=bar_x+100 && cor 	;
																;
;see if ball touched the brick 

;brick 1

mov ax,lvl
.IF brick1_t>=ax
jmp a
.ENDIF

mov ax,brick_y
add ax,10
cmp y_cor,ax													;
JNL a
mov ax,brick_y
cmp y_cor,ax
JNG a
mov ax,brick_x
add ax,30
cmp x_cor,ax													;
JNL a
mov ax,brick_x
cmp x_cor,ax
JNG a
;;;;;;;;;;;;;;;;;;												;
neg spd_y
inc points 
inc brick1_t
mov ax,lvl
.IF brick1_t==ax
inc won
.ENDIF
call beep

ret	

a:
;brick 2
mov ax,lvl
.IF brick2_t>=ax
jmp b
.ENDIF
mov ax,brick_y2
add ax,10
cmp y_cor,ax													;
JNL b
mov ax,brick_y2
cmp y_cor,ax
JNG b
mov ax,brick_x2
add ax,30
cmp x_cor,ax													;
JNL b
mov ax,brick_x2
cmp x_cor,ax
JNG b
;;;;;;;;;;;;;;;;;;												;
neg spd_y
inc points 
inc brick2_t
call beep
mov ax,lvl
.IF brick2_t==ax
inc won
.ENDIF
ret	


b:

;brick 3
mov ax,lvl
.IF brick3_t>=ax
jmp sk
.ENDIF
mov ax,brick_y3
add ax,10
cmp y_cor,ax													;
JNL sk
mov ax,brick_y3
cmp y_cor,ax
JNG sk
mov ax,brick_x3
add ax,30
cmp x_cor,ax													;
JNL sk
mov ax,brick_x3
cmp x_cor,ax
JNG sk
;;;;;;;;;;;;;;;;;;												;
neg spd_y
inc points 
inc brick3_t
mov ax,lvl
.IF brick3_t==ax
inc won
.ENDIF
call beep
ret	

sk:
;brick4
mov ax,lvl
.IF brick4_t>=ax
jmp sk2
.ENDIF
mov ax,brick_y4
add ax,10
cmp y_cor,ax													;
JNL sk2
mov ax,brick_y4
cmp y_cor,ax
JNG sk2
mov ax,brick_x4
add ax,30
cmp x_cor,ax													;
JNL sk2
mov ax,brick_x4
cmp x_cor,ax
JNG sk2
;;;;;;;;;;;;;;;;;;												;
neg spd_y
inc points 
inc brick4_t
call beep
mov ax,lvl
.IF brick4_t==ax
inc won
.ENDIF
ret 

sk2:
;brick5
mov ax,lvl
.IF brick5_t>=ax
jmp sk3
.ENDIF
mov ax,brick_y5
add ax,10
cmp y_cor,ax													;
JNL sk3
mov ax,brick_y5
cmp y_cor,ax
JNG sk3
mov ax,brick_x5
add ax,30
cmp x_cor,ax													;
JNL sk3
mov ax,brick_x5
cmp x_cor,ax
JNG sk3
;;;;;;;;;;;;;;;;;;												;
neg spd_y
inc points 
inc brick5_t
call beep
mov ax,lvl
.IF brick5_t==ax
inc won
.ENDIF
ret 

sk3:
;brick6
mov ax,lvl
.IF brick6_t>=ax
jmp sk4
.ENDIF
mov ax,brick_y6
add ax,10
cmp y_cor,ax													;
JNL sk4
mov ax,brick_y6
cmp y_cor,ax
JNG sk4
mov ax,brick_x6
add ax,30
cmp x_cor,ax													;
JNL sk4
mov ax,brick_x6
cmp x_cor,ax
JNG sk4
;;;;;;;;;;;;;;;;;;												;
neg spd_y
inc points 
inc brick6_t
call beep
mov ax,lvl
.IF brick6_t==ax
inc won
.ENDIF
ret 

sk4:
;brick7
mov ax,lvl
.IF brick7_t>=ax
jmp sk5
.ENDIF
mov ax,brick_y7
add ax,10
cmp y_cor,ax													;
JNL sk5
mov ax,brick_y7
cmp y_cor,ax
JNG sk5
mov ax,brick_x7
add ax,30
cmp x_cor,ax													;
JNL sk5
mov ax,brick_x7
cmp x_cor,ax
JNG sk5
;;;;;;;;;;;;;;;;;;												;
neg spd_y
inc points 
inc brick7_t
call beep
mov ax,lvl
.IF brick7_t==ax
inc won
.ENDIF
ret 


sk5:
;brick8
mov ax,lvl
.IF brick8_t>=ax
jmp sk6
.ENDIF
mov ax,brick_y8
add ax,10
cmp y_cor,ax													;
JNL sk6
mov ax,brick_y8
cmp y_cor,ax
JNG sk6
mov ax,brick_x8
add ax,30
cmp x_cor,ax													;
JNL sk6
mov ax,brick_x8
cmp x_cor,ax
JNG sk6
;;;;;;;;;;;;;;;;;;												;
neg spd_y
inc points 
inc brick8_t
call beep
mov ax,lvl
.IF brick8_t==ax
inc won
.ENDIF
ret 


sk6:
;brick9
mov ax,lvl
.IF brick9_t>=ax
jmp sk7
.ENDIF

mov ax,brick_y9
add ax,10
cmp y_cor,ax													;
JNL sk7
mov ax,brick_y9
cmp y_cor,ax
JNG sk7
mov ax,brick_x9
add ax,30
cmp x_cor,ax													;
JNL sk7
mov ax,brick_x9
cmp x_cor,ax
JNG sk7
;;;;;;;;;;;;;;;;;;												;
neg spd_y
inc points 
inc brick9_t
mov ax,lvl
.IF brick9_t==ax
inc won
.ENDIF
call beep
ret 



sk7:
;brick10
mov ax,lvl
.IF brick10_t>=ax
jmp sk8
.ENDIF
mov ax,brick_y10
add ax,10
cmp y_cor,ax													;
JNL sk8
mov ax,brick_y10
cmp y_cor,ax
JNG sk8
mov ax,brick_x10
add ax,30
cmp x_cor,ax													;
JNL sk8
mov ax,brick_x10
cmp x_cor,ax
JNG sk8
;;;;;;;;;;;;;;;;;;												;
neg spd_y
inc points 
inc brick10_t
call beep
.IF brick10_t==ax
inc won
.ENDIF
ret 


sk8:
;brick11
mov ax,lvl
.IF brick11_t>=ax
jmp sk9
.ENDIF

mov ax,brick_y11
add ax,10
cmp y_cor,ax													;
JNL sk9
mov ax,brick_y11
cmp y_cor,ax
JNG sk9
mov ax,brick_x11
add ax,30
cmp x_cor,ax													;
JNL sk9
mov ax,brick_x11
cmp x_cor,ax
JNG sk9
;;;;;;;;;;;;;;;;;;												;
neg spd_y
inc points 
inc brick11_t
call beep
mov ax,lvl
.IF brick9_t==ax
inc won
.ENDIF
ret 

sk9:
;brick12
mov ax,lvl
.IF brick12_t>=ax
jmp sk10
.ENDIF

mov ax,brick_y12
add ax,10
cmp y_cor,ax													;
JNL sk10
mov ax,brick_y12
cmp y_cor,ax
JNG sk10
mov ax,brick_x12
add ax,30
cmp x_cor,ax													;
JNL sk10
mov ax,brick_x12
cmp x_cor,ax
JNG sk10
;;;;;;;;;;;;;;;;;;												;
neg spd_y
inc points 
inc brick12_t
;if it hit brick 12 bonus inc and multiple balls appear
inc bonus
call beep
mov ax,lvl
.IF brick12_t==ax
inc won
.ENDIF
ret 


sk10:

;brick13
;fixed brick 
mov ax,lvl
.IF brick13_t>=ax
jmp sk11
.ENDIF

mov ax,brick_y13
add ax,10
cmp y_cor,ax													;
JNL sk11
mov ax,brick_y13
cmp y_cor,ax
JNG sk11
mov ax,brick_x13
add ax,30
cmp x_cor,ax													;
JNL sk11
mov ax,brick_x13
cmp x_cor,ax
JNG sk11
;;;;;;;;;;;;;;;;;;												;
neg spd_y
inc points 
call beep
.IF lvl==3
ret
.ENDIF
inc brick13_t
call beep
mov ax,lvl
.IF brick13_t==ax
inc won
.ENDIF

ret 

sk11:

;brick14
mov ax,lvl
.IF brick14_t>=ax
jmp sk12
.ENDIF

mov ax,brick_y14
add ax,10
cmp y_cor,ax													;
JNL sk12
mov ax,brick_y14
cmp y_cor,ax
JNG sk12
mov ax,brick_x14
add ax,30
cmp x_cor,ax													;
JNL sk12
mov ax,brick_x14
cmp x_cor,ax
JNG sk12
;;;;;;;;;;;;;;;;;;												;
neg spd_y
inc points 
inc brick14_t
call beep
mov ax,lvl
.IF brick14_t==ax
inc won
.ENDIF
ret 

sk12:
;brick15
mov ax,lvl
.IF brick15_t>=ax
jmp sk13
.ENDIF

mov ax,brick_y15
add ax,10
cmp y_cor,ax													;
JNL sk13
mov ax,brick_y15
cmp y_cor,ax
JNG sk13
mov ax,brick_x15
add ax,30
cmp x_cor,ax													;
JNL sk13
mov ax,brick_x15
cmp x_cor,ax
JNG sk13
;;;;;;;;;;;;;;;;;;												;
neg spd_y
inc points 
inc brick15_t
call beep
mov ax,lvl
.IF brick15_t==ax
inc won
.ENDIF
ret 


sk13:
;brick16

mov ax,lvl
.IF brick16_t>=ax
jmp sk14
.ENDIF
mov ax,brick_y16
add ax,10
cmp y_cor,ax													;
JNL sk14
mov ax,brick_y16
cmp y_cor,ax
JNG sk14
mov ax,brick_x16
add ax,30
cmp x_cor,ax													;
JNL sk14
mov ax,brick_x16
cmp x_cor,ax
JNG sk14
;;;;;;;;;;;;;;;;;;												;
neg spd_y
inc points 
inc brick16_t
call beep
mov ax,lvl
.IF brick16_t==ax
inc won
.ENDIF
ret 



sk14:
;brick17
mov ax,lvl
.IF brick17_t>=ax
jmp sk15
.ENDIF
mov ax,brick_y17
add ax,10
cmp y_cor,ax													;
JNL sk15
mov ax,brick_y17
cmp y_cor,ax
JNG sk15
mov ax,brick_x17
add ax,30
cmp x_cor,ax													;
JNL sk15
mov ax,brick_x17
cmp x_cor,ax
JNG sk15
;;;;;;;;;;;;;;;;;;												;
neg spd_y
inc points 
inc brick17_t
call beep
mov ax,lvl
.IF brick17_t==ax
inc won
.ENDIF
ret 



sk15:
;brick18
mov ax,lvl
.IF brick18_t>=ax
jmp sk16
.ENDIF

mov ax,brick_y18
add ax,10
cmp y_cor,ax													;
JNL sk16
mov ax,brick_y18
cmp y_cor,ax
JNG sk16
mov ax,brick_x18
add ax,30
cmp x_cor,ax													;
JNL sk16
mov ax,brick_x18
cmp x_cor,ax
JNG sk16
;;;;;;;;;;;;;;;;;;												;
neg spd_y
inc points 
inc brick18_t
call beep
mov ax,lvl
.IF brick18_t==ax
inc won
.ENDIF
ret 



sk16:
;bric20
mov ax,lvl

.IF brick20_t>=ax
jmp sk17
.ENDIF
mov ax,brick_y20
add ax,10
cmp y_cor,ax													;
JNL sk17
mov ax,brick_y20
cmp y_cor,ax
JNG sk17
mov ax,brick_x20
add ax,30
cmp x_cor,ax													;
JNL sk17
mov ax,brick_x20
cmp x_cor,ax
JNG sk17
;;;;;;;;;;;;;;;;;;												;
neg spd_y
inc points 
inc brick20_t
call beep
mov ax,lvl
.IF brick20_t==ax
inc won
.ENDIF
ret 




sk17:
;bric21

mov ax,lvl
.IF brick21_t>=ax
jmp sk18
.ENDIF
mov ax,brick_y21
add ax,10
cmp y_cor,ax													;
JNL sk18
mov ax,brick_y21
cmp y_cor,ax
JNG sk18
mov ax,brick_x21
add ax,30
cmp x_cor,ax													;
JNL sk18
mov ax,brick_x21
cmp x_cor,ax
JNG sk18
;;;;;;;;;;;;;;;;;;												;
neg spd_y
inc points 
inc brick21_t

call beep
mov ax,lvl
.IF brick21_t==ax
inc won
.ENDIF
ret 


sk18:
;bric22

mov ax,lvl
.IF brick22_t>=ax
jmp sk19
.ENDIF

mov ax,brick_y22
add ax,10
cmp y_cor,ax													;
JNL sk19
mov ax,brick_y22
cmp y_cor,ax
JNG sk19
mov ax,brick_x22
add ax,30
cmp x_cor,ax													;
JNL sk19
mov ax,brick_x22
cmp x_cor,ax
JNG sk19
;;;;;;;;;;;;;;;;;;												;
neg spd_y
inc points
call beep
mov ax,lvl
.IF brick22_t==ax
inc won
.ENDIF
inc brick22_t
ret 



sk19:
;bric23
mov ax,lvl
.IF brick23_t>=ax
jmp sk20
.ENDIF

mov ax,brick_y23
add ax,10
cmp y_cor,ax													;
JNL sk20
mov ax,brick_y23
cmp y_cor,ax
JNG sk20
mov ax,brick_x23
add ax,30
cmp x_cor,ax													;
JNL sk20
mov ax,brick_x23
cmp x_cor,ax
JNG sk20
;;;;;;;;;;;;;;;;;;												;
neg spd_y
inc points 
call beep
inc brick23_t
mov ax,lvl
.IF brick23_t==ax
inc won
.ENDIF
ret 




sk20:
;bric24
;fixed bricks
mov ax,lvl
.IF brick24_t>=ax
jmp sk21
.ENDIF

mov ax,brick_y24
add ax,10
cmp y_cor,ax													;
JNL sk21
mov ax,brick_y24
cmp y_cor,ax
JNG sk21
mov ax,brick_x24
add ax,30
cmp x_cor,ax													;
JNL sk21
mov ax,brick_x24
cmp x_cor,ax
JNG sk21
;;;;;;;;;;;;;;;;;;												;
neg spd_y
inc points
call beep
.IF lvl==3
ret
.ENDIF
mov ax,lvl
.IF brick21_t==ax
inc won
.ENDIF
inc brick24_t

ret 



sk21:
;bric19
mov ax,lvl
.IF brick19_t>=ax
jmp sk22
.ENDIF
mov ax,brick_y19
add ax,10
cmp y_cor,ax													;
JNL sk22
mov ax,brick_y19
cmp y_cor,ax
JNG sk22
mov ax,brick_x19
add ax,30
cmp x_cor,ax													;
JNL sk22
mov ax,brick_x19
cmp x_cor,ax
JNG sk22

;;;;;;;;;;;;;;;;;;												;
neg spd_y
inc points 
inc brick19_t
mov ax,lvl
.IF brick19_t==ax
inc won
.ENDIF
call beep
ret 



sk22:
mov ax,y_cor													;
add ax,03h														;
cmp ax,bar_y													;
jng ending														;
;;;;;;;;;;;;;;;;;;												;
mov ax,bar_y													;
add ax,bar_h 													;
cmp y_cor,ax													;
JNL ending														;
																;
;;;;;;;;;;;;;;;;;;												;
mov ax,x_cor													;
add ax,3														;
cmp ax,bar_x													;
JNG ending														;
;;;;;;;;;;;;;;;;;;												;
mov ax,bar_x													;
add ax,bar_w													;
cmp x_cor,ax													;
JNL ending														;
;;;;;;;;;;;;;;;;;;												;
neg spd_y	
call beep

ret																;



;;;;;;;;;;;;;;;;;;												;

ret	

ending:															;
ret																;
ball_change ENDP												;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;///////////////////////
;////

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ball2_change PROC												;
;draw ball at diff place 										;
;update the values of cordinates 								;
;move ball 														;
																;
																;
																;
mov ax,spd_y2													;
add y1_cor,ax													;
cmp y1_cor,010h ;if lower boundry crossed						;
JNL  skip1q  													;
neg spd_y2														;
skip1q:															;
cmp y1_cor,0BEh ;if upper boundry crossed						;
JNG skip2q														;
;add x1_cor,0A0h													;
sub y1_cor,64h
dec life
																;
skip2q:															;
mov ax,spd_x2													;
add x1_cor,ax													;
cmp x1_cor,010h ;if left boundry crossed							;
JNL  skip3q  													;
neg spd_x2														;
skip3q:															;
cmp x1_cor,12Ch ;if righhht boundry crossed						;
JNG skip4q														;
neg spd_x2													;
;draw ball in every 1/100 of sec								;
skip4q:															;
;check if ball id colilidin gwith the paddle 					;
;cor_y+3 >= bar_y && cor_x>=bar_x && cor_x+3<=bar_x+100 && cor 	;
																;
;see if ball touched the brick 

;brick 1

mov ax,lvl
.IF brick1_t>=ax
jmp aq
.ENDIF

mov ax,brick_y
add ax,10
cmp y1_cor,ax													;
JNL aq
mov ax,brick_y
cmp y1_cor,ax
JNG aq
mov ax,brick_x
add ax,30
cmp x1_cor,ax													;
JNL aq
mov ax,brick_x
cmp x1_cor,ax
JNG aq
;;;;;;;;;;;;;;;;;;												;
neg spd_y2
inc points 
inc brick1_t
mov ax,lvl
.IF brick1_t==ax
inc won
.ENDIF
call beep

ret	

aq:
;brick 2
mov ax,lvl
.IF brick2_t>=ax
jmp b2
.ENDIF
mov ax,brick_y2
add ax,10
cmp y1_cor,ax													;
JNL b2
mov ax,brick_y2
cmp y1_cor,ax
JNG b2
mov ax,brick_x2
add ax,30
cmp x1_cor,ax													;
JNL b2
mov ax,brick_x2
cmp x1_cor,ax
JNG b2
;;;;;;;;;;;;;;;;;;												;
neg spd_y2
inc points 
inc brick2_t
call beep
mov ax,lvl
.IF brick2_t==ax
inc won
.ENDIF
ret	


b2:

;brick 3
mov ax,lvl
.IF brick3_t>=ax
jmp skq
.ENDIF
mov ax,brick_y3
add ax,10
cmp y1_cor,ax													;
JNL skq
mov ax,brick_y3
cmp y1_cor,ax
JNG skq
mov ax,brick_x3
add ax,30
cmp x1_cor,ax													;
JNL skq
mov ax,brick_x3
cmp x1_cor,ax
JNG skq
;;;;;;;;;;;;;;;;;;												;
neg spd_y2
inc points 
inc brick3_t
mov ax,lvl
.IF brick3_t==ax
inc won
.ENDIF
call beep
ret	

skq:
;brick4
mov ax,lvl
.IF brick4_t>=ax
jmp sk2q
.ENDIF
mov ax,brick_y4
add ax,10
cmp y1_cor,ax													;
JNL sk2q
mov ax,brick_y4
cmp y1_cor,ax
JNG sk2q
mov ax,brick_x4
add ax,30
cmp x1_cor,ax													;
JNL sk2q
mov ax,brick_x4
cmp x1_cor,ax
JNG sk2q
;;;;;;;;;;;;;;;;;;												;
neg spd_y2
inc points 
inc brick4_t
call beep
mov ax,lvl
.IF brick4_t==ax
inc won
.ENDIF
ret 

sk2q:
;brick5
mov ax,lvl
.IF brick5_t>=ax
jmp sk3q
.ENDIF
mov ax,brick_y5
add ax,10
cmp y1_cor,ax													;
JNL sk3q
mov ax,brick_y5
cmp y1_cor,ax
JNG sk3q
mov ax,brick_x5
add ax,30
cmp x1_cor,ax													;
JNL sk3q
mov ax,brick_x5
cmp x1_cor,ax
JNG sk3q
;;;;;;;;;;;;;;;;;;												;
neg spd_y2
inc points 
inc brick5_t
call beep
mov ax,lvl
.IF brick5_t==ax
inc won
.ENDIF
ret 

sk3q:
;brick6
mov ax,lvl
.IF brick6_t>=ax
jmp sk4q
.ENDIF
mov ax,brick_y6
add ax,10
cmp y1_cor,ax													;
JNL sk4q
mov ax,brick_y6
cmp y1_cor,ax
JNG sk4q
mov ax,brick_x6
add ax,30
cmp x1_cor,ax													;
JNL sk4q
mov ax,brick_x6
cmp x1_cor,ax
JNG sk4q
;;;;;;;;;;;;;;;;;;												;
neg spd_y2
inc points 
inc brick6_t
call beep
mov ax,lvl
.IF brick6_t==ax
inc won
.ENDIF
ret 

sk4q:
;brick7
mov ax,lvl
.IF brick7_t>=ax
jmp sk5q
.ENDIF
mov ax,brick_y7
add ax,10
cmp y1_cor,ax													;
JNL sk5q
mov ax,brick_y7
cmp y1_cor,ax
JNG sk5q
mov ax,brick_x7
add ax,30
cmp x1_cor,ax													;
JNL sk5q
mov ax,brick_x7
cmp x1_cor,ax
JNG sk5q
;;;;;;;;;;;;;;;;;;												;
neg spd_y2
inc points 
inc brick7_t
call beep
mov ax,lvl
.IF brick7_t==ax
inc won
.ENDIF
ret 


sk5q:
;brick8
mov ax,lvl
.IF brick8_t>=ax
jmp sk6q
.ENDIF
mov ax,brick_y8
add ax,10
cmp y1_cor,ax													;
JNL sk6q
mov ax,brick_y8
cmp y1_cor,ax
JNG sk6q
mov ax,brick_x8
add ax,30
cmp x1_cor,ax													;
JNL sk6q
mov ax,brick_x8
cmp x1_cor,ax
JNG sk6q
;;;;;;;;;;;;;;;;;;												;
neg spd_y2
inc points 
inc brick8_t
call beep
mov ax,lvl
.IF brick8_t==ax
inc won
.ENDIF
ret 


sk6q:
;brick9
mov ax,lvl
.IF brick9_t>=ax
jmp sk7q
.ENDIF

mov ax,brick_y9
add ax,10
cmp y1_cor,ax													;
JNL sk7q
mov ax,brick_y9
cmp y1_cor,ax
JNG sk7q
mov ax,brick_x9
add ax,30
cmp x1_cor,ax													;
JNL sk7q
mov ax,brick_x9
cmp x1_cor,ax
JNG sk7q
;;;;;;;;;;;;;;;;;;												;
neg spd_y2
inc points 
inc brick9_t
mov ax,lvl
.IF brick9_t==ax
inc won
.ENDIF
call beep
ret 



sk7q:
;brick10
mov ax,lvl
.IF brick10_t>=ax
jmp sk8q
.ENDIF
mov ax,brick_y10
add ax,10
cmp y1_cor,ax													;
JNL sk8q
mov ax,brick_y10
cmp y1_cor,ax
JNG sk8q
mov ax,brick_x10
add ax,30
cmp x1_cor,ax													;
JNL sk8q
mov ax,brick_x10
cmp x1_cor,ax
JNG sk8q
;;;;;;;;;;;;;;;;;;												;
neg spd_y2
inc points 
inc brick10_t
call beep
.IF brick10_t==ax
inc won
.ENDIF
ret 


sk8q:
;brick11
mov ax,lvl
.IF brick11_t>=ax
jmp sk9q
.ENDIF

mov ax,brick_y11
add ax,10
cmp y1_cor,ax													;
JNL sk9q
mov ax,brick_y11
cmp y1_cor,ax
JNG sk9q
mov ax,brick_x11
add ax,30
cmp x1_cor,ax													;
JNL sk9q
mov ax,brick_x11
cmp x1_cor,ax
JNG sk9q
;;;;;;;;;;;;;;;;;;												;
neg spd_y2
inc points 
inc brick11_t
call beep
mov ax,lvl
.IF brick9_t==ax
inc won
.ENDIF
ret 

sk9q:
;brick12
mov ax,lvl
.IF brick12_t>=ax
jmp sk10q
.ENDIF

mov ax,brick_y12
add ax,10
cmp y1_cor,ax													;
JNL sk10q
mov ax,brick_y12
cmp y1_cor,ax
JNG sk10q
mov ax,brick_x12
add ax,30
cmp x1_cor,ax													;
JNL sk10q
mov ax,brick_x12
cmp x1_cor,ax
JNG sk10q
;;;;;;;;;;;;;;;;;;												;
neg spd_y2
inc points 
inc brick12_t
call beep
mov ax,lvl
.IF brick12_t==ax
inc won
.ENDIF
ret 


sk10q:

;brick13
;fixed brick 
mov ax,lvl
.IF brick13_t>=ax
jmp sk11q
.ENDIF

mov ax,brick_y13
add ax,10
cmp y1_cor,ax													;
JNL sk11q
mov ax,brick_y13
cmp y1_cor,ax
JNG sk11q
mov ax,brick_x13
add ax,30
cmp x1_cor,ax													;
JNL sk11q
mov ax,brick_x13
cmp x1_cor,ax
JNG sk11q
;;;;;;;;;;;;;;;;;;												;
neg spd_y2
inc points 
call beep
.IF lvl==3
ret
.ENDIF
inc brick13_t
call beep
mov ax,lvl
.IF brick13_t==ax
inc won
.ENDIF

ret 

sk11q:

;brick14
mov ax,lvl
.IF brick14_t>=ax
jmp sk12q
.ENDIF

mov ax,brick_y14
add ax,10
cmp y1_cor,ax													;
JNL sk12q
mov ax,brick_y14
cmp y1_cor,ax
JNG sk12q
mov ax,brick_x14
add ax,30
cmp x1_cor,ax													;
JNL sk12q
mov ax,brick_x14
cmp x1_cor,ax
JNG sk12q
;;;;;;;;;;;;;;;;;;												;
neg spd_y2
inc points 
inc brick14_t
call beep
mov ax,lvl
.IF brick14_t==ax
inc won
.ENDIF
ret 

sk12q:
;brick15
mov ax,lvl
.IF brick15_t>=ax
jmp sk13q
.ENDIF

mov ax,brick_y15
add ax,10
cmp y1_cor,ax													;
JNL sk13q
mov ax,brick_y15
cmp y1_cor,ax
JNG sk13q
mov ax,brick_x15
add ax,30
cmp x1_cor,ax													;
JNL sk13q
mov ax,brick_x15
cmp x1_cor,ax
JNG sk13q
;;;;;;;;;;;;;;;;;;												;
neg spd_y2
inc points 
inc brick15_t
call beep
mov ax,lvl
.IF brick15_t==ax
inc won
.ENDIF
ret 


sk13q:
;brick16

mov ax,lvl
.IF brick16_t>=ax
jmp sk14q
.ENDIF
mov ax,brick_y16
add ax,10
cmp y1_cor,ax													;
JNL sk14q
mov ax,brick_y16
cmp y1_cor,ax
JNG sk14q
mov ax,brick_x16
add ax,30
cmp x1_cor,ax													;
JNL sk14q
mov ax,brick_x16
cmp x1_cor,ax
JNG sk14q
;;;;;;;;;;;;;;;;;;												;
neg spd_y2
inc points 
inc brick16_t
call beep
mov ax,lvl
.IF brick16_t==ax
inc won
.ENDIF
ret 



sk14q:
;brick17
mov ax,lvl
.IF brick17_t>=ax
jmp sk15q
.ENDIF
mov ax,brick_y17
add ax,10
cmp y1_cor,ax													;
JNL sk15q
mov ax,brick_y17
cmp y1_cor,ax
JNG sk15q
mov ax,brick_x17
add ax,30
cmp x1_cor,ax													;
JNL sk15q
mov ax,brick_x17
cmp x1_cor,ax
JNG sk15q
;;;;;;;;;;;;;;;;;;												;
neg spd_y2
inc points 
inc brick17_t
call beep
mov ax,lvl
.IF brick17_t==ax
inc won
.ENDIF
ret 



sk15q:
;brick18
mov ax,lvl
.IF brick18_t>=ax
jmp sk16q
.ENDIF

mov ax,brick_y18
add ax,10
cmp y1_cor,ax													;
JNL sk16q
mov ax,brick_y18
cmp y1_cor,ax
JNG sk16q
mov ax,brick_x18
add ax,30
cmp x1_cor,ax													;
JNL sk16q
mov ax,brick_x18
cmp x1_cor,ax
JNG sk16q
;;;;;;;;;q;;;;;;;;;												;
neg spd_y2
inc points 
inc brick18_t
call beep
mov ax,lvl
.IF brick18_t==ax
inc won
.ENDIF
ret 



sk16q:
;bric20
mov ax,lvl

.IF brick20_t>=ax
jmp sk17q
.ENDIF
mov ax,brick_y20
add ax,10
cmp y1_cor,ax													;
JNL sk17q
mov ax,brick_y20
cmp y1_cor,ax
JNG sk17q
mov ax,brick_x20
add ax,30
cmp x1_cor,ax													;
JNL sk17q
mov ax,brick_x20
cmp x1_cor,ax
JNG sk17q
;;;;;;;;;;;;;;;;;;												;
neg spd_y2
inc points 
inc brick20_t
call beep
mov ax,lvl
.IF brick20_t==ax
inc won
.ENDIF
ret 




sk17q:
;bric21

mov ax,lvl
.IF brick21_t>=ax
jmp sk18q
.ENDIF
mov ax,brick_y21
add ax,10
cmp y1_cor,ax													;
JNL sk18q
mov ax,brick_y21
cmp y1_cor,ax
JNG sk18q
mov ax,brick_x21
add ax,30
cmp x1_cor,ax													;
JNL sk18q
mov ax,brick_x21
cmp x1_cor,ax
JNG sk18q
;;;;;;;;;q;;;;;;;;;												;
neg spd_y
inc points 
inc brick21_t

call beep
mov ax,lvl
.IF brick21_t==ax
inc won
.ENDIF
ret 


sk18q:
;bric22

mov ax,lvl
.IF brick22_t>=ax
jmp sk19q
.ENDIF

mov ax,brick_y22
add ax,10
cmp y1_cor,ax													;
JNL sk19q
mov ax,brick_y22
cmp y1_cor,ax
JNG sk19q
mov ax,brick_x22
add ax,30
cmp x1_cor,ax													;
JNL sk19q
mov ax,brick_x22
cmp x1_cor,ax
JNG sk19q
;;;;;;;;;;;;;;;;;;												;
neg spd_y
inc points
call beep
mov ax,lvl
.IF brick22_t==ax
inc won
.ENDIF
inc brick22_t
ret 



sk19q:
;bric23
mov ax,lvl
.IF brick23_t>=ax
jmp sk20q
.ENDIF

mov ax,brick_y23
add ax,10
cmp y1_cor,ax													;
JNL sk20q
mov ax,brick_y23
cmp y1_cor,ax
JNG sk20q
mov ax,brick_x23
add ax,30
cmp x1_cor,ax													;
JNL sk20q
mov ax,brick_x23
cmp x1_cor,ax
JNG sk20q
;;;;;;;;;;;;;;;;;;												;
neg spd_y
inc points 
call beep
inc brick23_t
mov ax,lvl
.IF brick23_t==ax
inc won
.ENDIF
ret 




sk20q:
;bric24
;fixed bricks
mov ax,lvl
.IF brick24_t>=ax
jmp sk21q
.ENDIF

mov ax,brick_y24
add ax,10
cmp y1_cor,ax													;
JNL sk21q
mov ax,brick_y24
cmp y1_cor,ax
JNG sk21q
mov ax,brick_x24
add ax,30
cmp x1_cor,ax													;
JNL sk21q
mov ax,brick_x24
cmp x1_cor,ax
JNG sk21q
;;;;;;;;;;;;;;;;;;												;
neg spd_y
inc points
call beep
.IF lvl==3
ret
.ENDIF
mov ax,lvl
.IF brick21_t==ax
inc won
.ENDIF
inc brick24_t
inc bonus
ret 



sk21q:
;bric19
mov ax,lvl
.IF brick19_t>=ax
jmp sk22q
.ENDIF
mov ax,brick_y19
add ax,10
cmp y1_cor,ax													;
JNL sk22q
mov ax,brick_y19
cmp y1_cor,ax
JNG sk22q
mov ax,brick_x19
add ax,30
cmp x1_cor,ax													;
JNL sk22q
mov ax,brick_x19
cmp x1_cor,ax
JNG sk22q

;;;;;;;;;;;;;;;;;;												;
neg spd_y
inc points 
inc brick19_t
mov ax,lvl
.IF brick19_t==ax
inc won
.ENDIF
call beep
ret 



sk22q:
mov ax,y1_cor													;
add ax,03h														;
cmp ax,bar_y													;
jng endingq														;
;;;;;;;;;;;;;;;;;;												;
mov ax,bar_y													;
add ax,bar_h 													;
cmp y1_cor,ax													;
JNL endingq													;
																;
;;;;;;;;;;;;;;;;;;												;
mov ax,x1_cor													;
add ax,3														;
cmp ax,bar_x													;
JNG endingq														;
;;;;;;;;;;;;;;;;;;												;
mov ax,bar_x													;
add ax,bar_w													;
cmp x1_cor,ax													;
JNL endingq														;
;;;;;;;;;;;;;;;;;;												;
neg spd_y2	
call beep

ret																;



;;;;;;;;;;;;;;;;;;												;

ret	

endingq:															;
ret																;
ball2_change ENDP												;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;




allzero proc 

mov points,0
mov brick1_t ,0
mov brick2_t ,0
mov brick3_t ,0
mov brick4_t ,0
mov brick5_t ,0
mov brick6_t ,0

mov brick7_t ,0
mov brick8_t ,0
mov brick9_t ,0
mov brick10_t, 0
mov brick11_t, 0
mov brick12_t, 0

mov brick13_t, 0
mov brick14_t, 0
mov brick15_t, 0
mov brick16_t, 0
mov brick17_t, 0
mov brick18_t, 0

mov brick19_t, 0
mov brick20_t, 0
mov brick21_t, 0
mov brick22_t, 0
mov brick23_t, 0
mov brick24_t, 0

ret
allzero endp
;win screen 
winsc proc
 call cls
mov dx, offset msgwon				; displaying message
		mov ah, 09
		int 21h
jmp EXIT

ret
winsc endp

bonusf proc 

ret 
bonusf endp

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;proc to move the bar by input as per what key is pressed		 ;
bar_mov PROC													 ;
cmp bar_x,00h													 ;
jbe no_key_pressed												 ;
;keyboard interept 												 ;
mov ah,01														 ;
int 16h															 ;
jz no_key_pressed												 ;
mov ah,0														 ;
int 16h															 ;
cmp ah,4bh														 ;
je move_left													 ;
cmp ah,4dh														 ;
je move_right
;check if escape is pressed
cmp ah, 1Bh
jmp mm
												 ;
mm:
call mainMenu
jmp no_key_pressed
																 ;
move_right:														 ;
add bar_x,10													 ;
mov ax,bar_x													 ;
add ax,bar_w													 ;
cmp ax,140h														 ;
jge reset_bar													 ;
jmp no_key_pressed												 ;
																 ;
move_left:														 ;
sub bar_x,10													 ;
cmp bar_x,00h													 ;
jbe reset_bar													 ;
jmp no_key_pressed												 ;
																 ;
reset_bar:														 ;
mov bar_x,100													 ;
mov bar_y,175													 ;
jmp no_key_pressed												 ;
																 ;
																 ;
																 ;
no_key_pressed:													 ;
ret																 ;
bar_mov ENDP													 ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;procedure to print the ball                   ;
ball PROC								 	   ;
;starting point of ball 					   ;
mov dx,y_cor 							 	   ;
mov cx,x_cor								   ;
											   ;
;to make ball big we print pixel on five values; 
;first verticall print 4 times  			   ;
;nested loop ha aik kisam ka 				   ;
ver:										   ;
mov ah,0Ch ;writing a pixell 			 	   ;
mov al,0Fh; choosing color of the pixel  	   ;
mov bh,00h; page 						 	   ;
int 10h		;								   ;
inc dx										   ;
mov ax,dx									   ;
sub ax,y_cor								   ;
cmp ax,3									   ;
jne ver										   ;
;reset the value to start 					   ;
mov dx,y_cor								   ;
inc cx										   ;
mov ax,cx									   ;
sub ax,x_cor								   ;
cmp ax,3									   ;
jne ver										   ;
ret											   ;
ball ENDP 								 	   ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;procedure to print the ball                   ;
ball2 PROC								 	   ;
;starting point of ball 					   ;
mov dx,y1_cor 							 	   ;
mov cx,x1_cor								   ;
											   ;
;to make ball big we print pixel on five values; 
;first verticall print 4 times  			   ;
;nested loop ha aik kisam ka 				   ;
verball2:										   ;
mov ah,0Ch ;writing a pixell 			 	   ;
mov al,0Fh; choosing color of the pixel  	   ;
mov bh,00h; page 						 	   ;
int 10h		;								   ;
inc dx										   ;
mov ax,dx									   ;
sub ax,y1_cor								   ;
cmp ax,3									   ;
jne verball2									   ;
;reset the value to start 					   ;
mov dx,y1_cor								   ;
inc cx										   ;
mov ax,cx									   ;
sub ax,x1_cor								   ;
cmp ax,3									   ;
jne verball2										   ;
ret											   ;
ball2 ENDP 								 	   ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
cLs PROC										;
;procedure to clear screen						;
mov ah,00h ;conf video mode 					;
mov al,13h ;video mode 							;
int 10h 										;
												;
;background										;
mov ah,0Bh										;
;mov bh,3										;
;mov bl,3;bak ground color 					;
mov bx,3
int 21h 										;
ret												;
cLs ENDP										;					
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;							

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;						
;procedure to make bar 						   ;
bar PROC									   ;
mov dx,bar_y								   ;
mov cx,bar_x								   ;
bar1:										   ;
mov ah,0Ch ;writing a pixell 			 	   ;
mov al,0Fh; choosing color of the pixel  	   ;
mov bh,00h; page 						 	   ;
int 10h										   ;
inc dx										   ;
mov ax,dx									   ;
sub ax,bar_y								   ;
cmp ax,bar_h								   ;
jne bar1									   ;
;reset the value to start 					   ;
mov dx,bar_y								   ;
inc cx										   ;
mov ax,cx									   ;
sub ax,bar_x								   ;
cmp ax,bar_w								   ;
jne bar1									   ;
ret											   ;
bar ENDP									   ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;						

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;						
;procedure to make bar 						   ;
bricle PROC									   ;
mov dx,brick_y								   ;
mov cx,brick_x								   ;
brcl:										   ;
mov ah,0Ch ;writing a pixell 			 	   ;
mov al,0Fh; choosing color of the pixel  	   ;
mov bh,00h; page 						 	   ;
int 10h										   ;
inc dx										   ;
mov ax,dx									   ;
sub ax,brick_y								   ;
cmp ax,bar_h								   ;
jne brcl									   ;
;reset the value to start 					   ;
mov dx,brick_y								   ;
inc cx										   ;
mov ax,cx									   ;
sub ax,bar_x								   ;
cmp ax,bar_w								   ;
jne brcl								   ;
ret	
;
bricle ENDP									   ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;							
;proc to reset the ball position 				 ;
ball_mid PROC									 ;
mov x_cor,0A0h   ;6Eh						     ;
mov y_cor,64h  ;64h							     ;
												 ;
ret												 ;
ball_mid endp									 ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;							



heart proc


;setting cursor position
mov ah, 2
mov dh, 0     ;row
mov dl, 197     ;column
int 10h

mov al,3    ;ASCII code of Character 
mov bx,0
mov bl,12  ;Green color
mov cx,life     ;repetition count
mov ah,09h
int 10h


mov dh, 0     ;row
mov dl, 0
ret 
heart endp

score proc
   


mov dh, 0     ;row
mov dl, 0     ;column
int 10h
	mov dx, offset sc		; displaying string
		mov ah, 09
		int 21h
		


		mov ah, 2

		mov dx,points 

		.IF dx>9
		mov points,0
		inc exc
      
      .ELSEIF exc==1 
	  mov dx,0
	  add DX, 49
	MOV AH, 02H
	INT 21H

mov dx,points
add DX, 48
	MOV AH, 02H
	INT 21H
	   .ELSEIF exc==2
	  mov dx,1
	  add DX, 49
	MOV AH, 02H
	INT 21H

mov dx,points
add DX, 48
	MOV AH, 02H
	INT 21H
	.ELSE
	mov dx,points
add DX, 48
	MOV AH, 02H
	INT 21H

.ENDIF





ret
score endp



beep proc
        push ax
        push bx
        push cx
        push dx
        mov     al, 182         ; Prepare the speaker for the
        out     43h, al         ;  note.
        mov     ax, 400        ; Frequency number (in decimal)
                                ;  for middle C.
        out     42h, al         ; Output low byte.
        mov     al, ah          ; Output high byte.
        out     42h, al 
        in      al, 61h         ; Turn on note (get value from
                                ;  port 61h).
        or      al, 00000011b   ; Set bits 1 and 0.
        out     61h, al         ; Send new value.
        mov     bx, 2          ; Pause for duration of note.
pause1:
        mov     cx, 65535
pause2:
        dec     cx
        jne     pause2
        dec     bx
        jne     pause1
        in      al, 61h         ; Turn off note (get value from
                                ;  port 61h).
        and     al, 11111100b   ; Reset bits 1 and 0.
        out     61h, al         ; Send new value.

        pop dx
        pop cx
        pop bx
        pop ax

ret
beep endp


;hashir ka code starts 

mainMenu proc
		
		
	loop1:
		mov dx, offset msg1					; displaying message
		mov ah, 09
		int 21h
		mov dx, offset msg2					; displaying message
		mov ah, 09
		int 21h
		mov dx, offset msg3					; displaying message
		mov ah, 09
		int 21h
		mov dx, offset msg8				; displaying message
		mov ah, 09
		int 21h
		mov dx, offset msg7					; displaying message
		mov ah, 09
		int 21h

		mov dx, offset msg9					; displaying message
		mov ah, 09
		int 21h
		mov dx, offset msg6					; displaying message
		mov ah, 09
		int 21h
		
		
		
		

		mov dx, offset msg4					; displaying message
		mov ah, 09
		int 21h


		mov dx, offset msg5					; displaying message
		mov ah, 09
		int 21h
	 mov ah,00h
 int 16h

 ;check if player entered 1
 cmp al,'1'
 je ooo


 cmp al,'2'
 je L2
 ;do changes for level 2
 
 
 cmp al,'3'
 ;do changes for level 3
 je L3

 cmp al,'4'
 je insi 

  cmp al,'5'
 je ooo 

  cmp al,'6'
 je EXIT

 jmp ooo

	insi:
	call instruct
		 mov ah,00h
         int 16h
		 ret

		 L2:
		 call level2
		 ret

		  L3:
		 call level3
		 ret
ooo:
ret        
mainMenu endP


level2 proc 
mov lvl,2
mov spd_x,06h
mov spd_y,06h
mov bar_w,40
mov points,0
mov won,0
mov bonus,0
ret
level2 endp

level3 proc 
mov lvl,3
mov spd_x,07h
mov spd_y,07h
mov bar_w,30
mov points,0
mov won,0
mov bonus,0
ret
level3 endp

InputName proc
		mov dx, offset msgInput			; displaying string
		mov ah, 09
		int 21h
		
		mov dx, offset _name			; taking input of name
		mov ah, 3Fh
		int 21h
		ret
InputName endP


Instruct proc
        mov dx, offset Instructions			; displaying string
		mov ah, 09
		int 21h


		ret
Instruct endp


;hashir ka code ends 

gameOver:



;store data in file


;create one time only
mov ah, 3CH ;service to create a file
mov cl, 0 ; 0 readonly, 1 hidden & 2 system file
mov dx, offset file
int 21h


mov ah, 3DH
mov al, 1 ; 0 for reading, 1 for writing. 2 for both
mov dx, offset file
int 21h
mov Filehandle,ax


mov cx,0
mov dx, 0
mov bx,ax
mov ah,42h
mov al,02h ; 0 beginning of file, 2 end of file
int 21h



mov bx, Filehandle
mov cx, LENGTHOF _name

mov dx,offset _name
mov ah, 40H
int 21h

mov cx,0
mov dx, 0
mov bx,ax
mov ah,42h
mov al,02h ; 0 beginning of file, 2 end of file
int 21h

mov bx, Filehandle
mov cx, LENGTHOF score6

.IF won==2
mov dx,offset score1
mov ah, 40H
int 21h

.ENDIF

.IF won==0
mov dx,offset score2
mov ah, 40H
int 21h

.ENDIF
.IF won==3
mov dx,offset score3
mov ah, 40H
int 21h

.ENDIF
.IF won==4
mov dx,offset score4
mov ah, 40H
int 21h

.ENDIF
.IF won==5
mov dx,offset score5
mov ah, 40H
int 21h

.ENDIF

.IF won==6
mov dx,offset score6
mov ah, 40H
int 21h

.ENDIF

.IF won==10
mov dx,offset score10
mov ah, 40H
int 21h

.ENDIF

.IF won==11
mov dx,offset score11
mov ah, 40H
int 21h

.ENDIF

.IF won==12
mov dx,offset score12
mov ah, 40H
int 21h

.ENDIF

.IF won==13
mov dx,offset score13
mov ah, 40H
int 21h

.ENDIF

.IF won==14
mov dx,offset score14
mov ah, 40H
int 21h

.ENDIF

.IF won==15
mov dx,offset score15
mov ah, 40H
int 21h

.ENDIF

.IF won==16
mov dx,offset score16
mov ah, 40H
int 21h

.ENDIF

.IF won==17
mov dx,offset score17
mov ah, 40H
int 21h

.ENDIF

.IF won==18
mov dx,offset score18
mov ah, 40H
int 21h

.ENDIF

.IF won==19
mov dx,offset score19
mov ah, 40H
int 21h

.ENDIF

.IF won==20
mov dx,offset score20
mov ah, 40H
int 21h

.ENDIF

.IF won==21
mov dx,offset score21
mov ah, 40H
int 21h

.ENDIF

.IF won==22
mov dx,offset score22
mov ah, 40H
int 21h

.ENDIF

.IF won==23
mov dx,offset score23
mov ah, 40H
int 21h

.ENDIF

.IF won==24
mov dx,offset score24
mov ah, 40H
int 21h

.ENDIF





mov cx,0
mov dx, 0
mov bx,ax
mov ah,42h
mov al,02h ; 0 beginning of file, 2 end of file
int 21h


mov bx, Filehandle
mov cx, LENGTHOF livil1




.IF lvl==2
mov dx,offset livil2
mov ah, 40H
int 21h

.ENDIF

.IF lvl==1
mov dx,offset livil1
mov ah, 40H
int 21h

.ENDIF

.IF lvl==3
mov dx,offset livil3
mov ah, 40H
int 21h

.ENDIF

call cls
 mov ah,02h 
 mov ch,00h
 mov dh,06h 
 mov dl,05h
 int 10h 
 mov ah,09h
 lea dx ,game_over


 int 21h 
 mov ah,02h 
 mov ch,00h
 mov dh,08h 
 mov dl,05h
 int 10h 
 mov ah,09h
 lea dx , play_again
 int 21h 

;  int 21h 
; mov ah,02h 
; mov ch,00h
; mov dh,010h 
; mov dl,05h
; int 10h 
; mov ah,09h
; lea dx , no_play
; int 21h 


 ;wait for key to be presesd
 mov ah,00h
 int 16h

 ;check if player entered R
 cmp al,'r'
mov life,3
call allzero
mov points,0
mov won,0
 call cls
 je MIGHTY_GAME


 cmp al,'R'

call cls
mov life,3
call allzero
mov points,0
mov won,0
 je MIGHTY_GAME

EXIT:
mov ah,4ch 
int 21h 
end