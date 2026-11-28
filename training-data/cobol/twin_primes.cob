       IDENTIFICATION DIVISION.
       PROGRAM-ID. TWINPRIMES.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 P      PIC 99.
       01 Q      PIC 99.
       01 D      PIC 99.
       01 CAND   PIC 99.
       01 OK     PIC 9.
       01 P-OK   PIC 9.
       01 Q-OK   PIC 9.

       PROCEDURE DIVISION.
           PERFORM VARYING P FROM 3 BY 1 UNTIL P > 48
               COMPUTE Q = P + 2
               MOVE P TO CAND
               PERFORM CHECK-PRIME
               MOVE OK TO P-OK
               MOVE Q TO CAND
               PERFORM CHECK-PRIME
               MOVE OK TO Q-OK
               IF P-OK = 1 AND Q-OK = 1
                   DISPLAY "(" P ", " Q ")"
               END-IF
           END-PERFORM
           STOP RUN.

       CHECK-PRIME.
           MOVE 1 TO OK
           PERFORM VARYING D FROM 2 BY 1 UNTIL D * D > CAND
               IF FUNCTION MOD(CAND, D) = 0
                   MOVE 0 TO OK
               END-IF
           END-PERFORM.
