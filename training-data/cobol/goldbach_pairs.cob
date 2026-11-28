       IDENTIFICATION DIVISION.
       PROGRAM-ID. GOLDBACH.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 N      PIC 99 VALUE 28.
       01 P      PIC 99.
       01 Q      PIC 99.
       01 D      PIC 99.
       01 CAND   PIC 99.
       01 OK     PIC 9.
       01 P-OK   PIC 9.

       PROCEDURE DIVISION.
           PERFORM VARYING P FROM 2 BY 1 UNTIL P > 14
               COMPUTE Q = N - P
               MOVE P TO CAND
               PERFORM CHECK-PRIME
               MOVE OK TO P-OK
               MOVE Q TO CAND
               PERFORM CHECK-PRIME
               IF P-OK = 1 AND OK = 1
                   DISPLAY P " + " Q
               END-IF
           END-PERFORM
           STOP RUN.

       CHECK-PRIME.
           MOVE 1 TO OK
           IF CAND < 2
               MOVE 0 TO OK
           END-IF
           PERFORM VARYING D FROM 2 BY 1 UNTIL D * D > CAND
               IF FUNCTION MOD(CAND, D) = 0
                   MOVE 0 TO OK
               END-IF
           END-PERFORM.
