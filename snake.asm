assume cs:code,ss:stack,ds:maindata
;==================================================
;main code
;==================================================
code    segment
start:  mov ax,maindata  
        mov ds,ax
        mov ax,stack
        mov ss,ax
        mov sp,0
;==================================================
;menu code
;==================================================
menu:

menuwait:


open:
;__________________________________________________
;draw boxboader
		mov ax,disMod[0]
		mov bx,disMod[2]
		;int 10H
		
		mov cx,0
		mov dx,0
		mov ah,0CH
		mov al,backcolor
		
ground:	int 10H
		inc cx
		cmp cx,resolx
		jb ground
		mov cx,0
		inc dx
		cmp dx,resoly
		jb ground
;__________________________________________________
;boxinit
		mov bx,resoly   ;calculate the gamebox size
        mov ax,bx
        div cellsize
        mov winWidth,ax
        mov widHeight,ax
		mul cellsize
		mov bx,ax
		shr dx,1
		mov cx,dx
		dec cx
		mov boundary[4],cx
		add bx,dx
		mov boundary[6],bx
		mov bx,resolx
		sub bx,ax
		shr bx,1
		add ax,bx
		mov boundary[2],ax
		dec bx
		mov boundary[0],bx
		
		
;game controller
;==================================================
game:

		mov ax,4C00H
		int 21H

code    ends
;==================================================
;maindata
;==================================================
maindata    segment
    disMod      dw 4F02H,107H   ;displaymodedata
	backcolor	db 0
	frontcolor	db 0FFH
    resolx      dw 1280
	resoly		dw 1080
    cellsize    dw 50           ;cell
    winWidth    dw 0            ;cell snake size
    widHeight   dw 0
    boundary    dw 0,0,0,0      ;boundary coordinate
maindata    ends
;==================================================
;subpro area
;==================================================
subdata     segment
    ending	dw 4               ;snake end point
    vector  dw 1,0               ;snake forward orientation
	skbody	dw 441 dup(0)
subdata     ends
;==================================================
;main stack
;==================================================
stack   segment
    db  128 dup(0)
stack   ends
end     start
