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

jmp menuwait

box:    mov bx,resola[2]    ;calculate the gamebox size
        mov ax,bx
        div cellsize
        mov winWidth,ax
        mov widHeight,ax
        shl dx,1
        mov boundary[4],dx
        mov boundary[6],bx
        sub boundary[6],dx
        mov bx,boundary[6]
        sub bx,dx
        mov ax,resola[0]
        sub ax,bx
        shl ax,1
        mov boundary[0],ax
        add ax,bx
        mov boundary[2],ax
        

;==================================================
;game controller
;==================================================
game:

jmp game
code    ends
;==================================================
;maindata
;==================================================
maindata    segment
    disMod      dw 4F02H,107H   ;displaymodedata
    resola      dw 1280,1024
    cellsize    dw 50           ;cell
    winWidth    dw 0            ;cell snake size
    widHeight   dw 0
    boundary    dw 0,0,0,0      ;boundary coordinate
maindata    ends
;==================================================
;subpro area
;==================================================
subdata     segment
    startP  dw 0,0               ;snake start point
    overP   dw 0,0               ;snake end point
    vector  dw 1,0               ;snake forward orientation
subdata     ends


;==================================================
;main stack
;==================================================
stack   segment
    db  1000 dup(0)
stack   ends
end     start