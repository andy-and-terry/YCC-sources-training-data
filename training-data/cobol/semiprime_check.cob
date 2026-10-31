       IDENTIFICATION DIVISION.
       PROGRAM-ID. SEMIPRIME.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 N        PIC 9(3).
       01 M        PIC 9(3).
       01 P        PIC 9(3).
       01 CNT      PIC 9(2).
       PROCEDURE DIVISION.
           PERFORM VARYING N FROM 2 BY 1 UNTIL N > 29
               MOVE N TO M
               MOVE 0 TO CNT
               MOVE 2 TO P
               PERFORM UNTIL P * P > M
                   PERFORM UNTIL FUNCTION MOD(M, P) NOT = 0
                       COMPUTE M = M / P
                       ADD 1 TO CNT
                   END-PERFORM
                   ADD 1 TO P
               END-PERFORM
               IF M > 1
                   ADD 1 TO CNT
               END-IF
               IF CNT = 2
                   DISPLAY N
               END-IF
           END-PERFORM
           STOP RUN.
