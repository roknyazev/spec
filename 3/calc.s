 .text
      .global Start_DSP
      .global OutC
      .global ArrX
      .global ArrA
      .global ArrB

/* собственно, программа для DSP-ядра */
Start_DSP:


        MOVE OutC, A1
        MOVE 1, IT
        MOVE ArrX, AT
        MOVE ArrA, A0
        MOVE ArrB, A2
        MOVE (AT)+IT, R0.L
        MOVE (A0)+, R2.L
        MOVE (A2)+, R4.L
        MOVE 29, R8.L
        CLRL R6
        CLRL R10
        CLRL R12
        CLRL R14
PAR:

        ADDL R0.L, R2.L, R6.L   ADDL R0.L, R4.L, R10.L (AT)+IT, R0.L (A0)+, R2.L
        MOVE (A2)+, R4.L
        MPYL R6.L, R10.L, R12.D
        ADDL R14.L, R12.L, R14.L
        DECL R8.L, R8.L
        J.ne PAR
        ADDL R14.L, R12.L, R14.L
        MOVE R14.L, (A1)
        STOP

 .data
OutC: .word 0
ArrX: .space 30*4, 0
ArrA: .space 30*4, 0
ArrB: .space 30*4, 0
 .end
