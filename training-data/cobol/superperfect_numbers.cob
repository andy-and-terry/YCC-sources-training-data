       IDENTIFICATION DIVISION.
       PROGRAM-ID. SUPERPERFECT.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 N        PIC 999.
       01 D        PIC 9(4).
       01 ARG      PIC 9(4).
       01 SUM-OUT  PIC 9(4).
       01 SIGMA1   PIC 9(4).
       01 SIGMA2   PIC 9(4).
       PROCEDURE DIVISION.
           PERFORM VARYING N FROM 1 BY 1 UNTIL N > 99
               MOVE N TO ARG
               PERFORM COMPUTE-SIGMA
               MOVE SUM-OUT TO SIGMA1
               MOVE SIGMA1 TO ARG
               PERFORM COMPUTE-SIGMA
               MOVE SUM-OUT TO SIGMA2
               IF SIGMA2 = 2 * N
                   DISPLAY N
               END-IF
           END-PERFORM
           STOP RUN.
       COMPUTE-SIGMA.
           MOVE 0 TO SUM-OUT
           PERFORM VARYING D FROM 1 BY 1 UNTIL D > ARG
               IF FUNCTION MOD(ARG, D) = 0
                   ADD D TO SUM-OUT
               END-IF
           END-PERFORM.
      * Prints 002 004 016 064
