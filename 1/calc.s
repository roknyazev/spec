 /* описания для main.c */
 .text
      .global Start_DSP
      .global InA
      .global InB
      .global InX
      .global OutS


/* сегмент кода */
Start_DSP:
      MOVE (A1),R0.L
      MOVE (A2),R2.L
      MOVE (A3),R4.L
      MOVE 1, R6.L
      MOVE 0, R8.L
      MOVE 0, R10.L
      MOVE 0, R12.L
      MOVE 0, R14.L
      DO 30,END1
      ADDL R2.L, R4.L, R8.L
      ADDL R0.L, R4.L, R10.L
      MPYL R8.L, R10.L, R12.D
      ADDL R12.L, R14.L, R14.L
 END1:INCL R6.L,R6.L
      MOVE R14.L,(A4)
          STOP

/* сегмент данных */
 .data
InA:  .space 30*4, 0
InB:  .space 30*4, 0
InX:  .space 30*4, 0
OutS: .word 0
 .end