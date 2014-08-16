; Author: 
; Gloria Martorella <gloria.martorella@unipa.it>
; DICGIM - University of Palermo - Italy
; Viale delle Scienze - Ed. 6, 90128 Palermo, Italy

; Date: 2014
; License: General Public License (GPL) Version2 from 1991.

; Written on the basis of B. J. Rodriguez and Matthias Trute code 
; "1wire.asm"
; Written according to DS2401 datasheet 


;.EQU OW_BIT=4
;.equ OW_PORT=PORTE
.set OW_DDR=(OW_PORT-1)
.set OW_PIN=(OW_DDR-1)

.macro PIN_INIT 
    cbi OW_DDR, OW_BIT
    cbi OW_PORT, OW_BIT
.endmacro


.macro OW_DRIVE 
    sbi OW_DDR, OW_BIT
    cbi OW_PORT, OW_BIT
.endmacro

.macro OW_RELEASE
    cbi OW_DDR, OW_BIT
    sbi OW_PORT, OW_BIT 
.endmacro

.macro RESET
    savetos
    clr tosh
    OW_DRIVE     
    DELAY   500
    OW_RELEASE
    DELAY   70 ; delayB
    in tosl, OW_PIN
    sbrs tosl, OW_BIT
    ser  tosh
   
    DELAY   410
    mov tosl, tosh
.endmacro



VE_1W_INIT:
    .dw $ff07
    .db "1w.init",0
    .dw VE_HEAD
    .set VE_HEAD = VE_1W_INIT
XT_1W_INIT:
    .dw PFA_1W_INIT
PFA_1W_INIT:
    PIN_INIT
    RESET
    jmp_ DO_NEXT
    
   
    





VE_1W_WRBYTE:
    .dw $ff09
    .db "1w.wrbyte"
    .dw VE_HEAD
    .set VE_HEAD = VE_1W_WRBYTE
XT_1W_RESET:
    .dw PFA_1W_WRBYTE
PFA_1W_WRBYTE:
    ldi tosl, $33 
    ldi temp0, 8
    clc
PFA_1W_WRBYTE_LOOP:
    ror tosl
    brcc PFA_1W_WRBYTE1
    OW_DRIVE 
    DELAY   6 ;tA
    OW_RELEASE
    DELAY 64 ;tB
    dec temp0
    brne PFA_1W_WRBYTE_LOOP
    jmp_ DO_NEXT

PFA_1W_WRBYTE1:
    OW_DRIVE 
    DELAY   60 ;tC
    OW_RELEASE
    DELAY 10 ;tD
    dec temp0
    brne PFA_1W_WRBYTE_LOOP
    jmp_ DO_NEXT

VE_1W_RDBYTE:
    .dw $ff09
    .db "1w.rdbyte"
    .dw VE_HEAD
    .set VE_HEAD = VE_1W_RDBYTE
XT_1W_RDBYTE:
    .dw PFA_1W_RDBYTE
PFA_1W_RDBYTE:
    savetos
    ldi tosl, 0
    ldi tosh, 0
    ldi temp0, 8
PFA_1W_RDBYTE_LOOP:  
    OW_DRIVE 
    DELAY 6   ; tA
    OW_RELEASE
    DELAY 9   ; tE
    in temp2, OW_PIN
    clc
    sbrc temp2, OW_BIT
    sec
    ror tosl
    DELAY   55 ; tF
    dec temp0
    brne PFA_1W_RDBYTE_LOOP
   
    jmp_ DO_NEXT

