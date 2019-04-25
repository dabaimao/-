assume cs:code,ss:stack,ds:data
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

jmp menu
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
    resola      dw 0,0
    cellsize    dw 0            ;cell
    winWidth    dw 0            ;cell snake size
    widHeight   dw 0
    boundary    dw 0,0,0,0      ;boundary coordinate
maindata    ends
;==================================================
;main stack
;==================================================
stack   segment
    db  10000 dup(0)
stack   ends
;==================================================
;subpro area
;==================================================
subdata     segment
    startP  dw 0                ;snake start point
    overP   dw 0                ;snake end point
subdata     ends

end     start