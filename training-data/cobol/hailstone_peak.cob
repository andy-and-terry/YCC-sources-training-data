       IDENTIFICATION DIVISION.
       PROGRAM-ID. HAILPEAK.
      * Highest value reached by the Collatz sequence from 27.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 N        PIC 9(9) VALUE 27.
       01 BEST     PIC 9(9) VALUE 27.
       PROCEDURE DIVISION.
           PERFORM UNTIL N = 1
               IF FUNCTION MOD(N, 2) = 0
                   COMPUTE N = N / 2
               ELSE
                   COMPUTE N = 3 * N + 1
               END-IF
               IF N > BEST
                   MOVE N TO BEST
               END-IF
           END-PERFORM
           DISPLAY BEST
           STOP RUN.
