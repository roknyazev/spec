 /* описания для main.c */
 .text
      .global Start_DSP
      .global InA
      .global InB
      .global InX
      .global OutS


/* сегмент кода */
Start_DSP:
      MOVE InX, AT
      MOVE InA, A0
      MOVE InB, A2
      MOVE 1, IT
      MOVE (AT)+IT, R0.L
      MOVE (A0)+, R2.L
      MOVE (A2)+, R10.L
      DO 31, END5
      MOVE R0.L, R1.L
      MOVE R0.D, R1.D
      MOVE R10.L, R3.L
      MOVE R2.D, R3.D
      ALL2 R0.D, R2.D, R4.D
      MOVE (AT)+IT, R0.L
      MOVE (A0)+, R2.L
      MOVE (A2)+, R10.L
      MOVE R4.D, R5.D
      TRL R4.L, R5.L R5.L, R4.L
      MACL R4.L, R5.L, R6.D
END5: NOP
      STOP

/* сегмент данных */
 .data
InA:  .space 30*4, 0
InB:  .space 30*4, 0
InX:  .space 30*4, 0
OutS: .word 0
 .end