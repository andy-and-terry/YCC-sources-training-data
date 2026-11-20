       IDENTIFICATION DIVISION.
       PROGRAM-ID. GOLDBACH.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 N    PIC 99 VALUE 28.
       01 P    PIC 99.
       01 Q    PIC 99.
       01 TST  PIC 99.
       01 D    PIC 99.
       01 FLAG PIC 9.
       01 PRIME-P PIC 9.
       01 PRIME-Q PIC 9.
       PROCEDURE DIVISION.
           PERFORM VARYING P FROM 2 BY 1 UNTIL P > 14
               COMPUTE Q = N - P
               MOVE P TO TST
               PERFORM CHECK-PRIME
               MOVE FLAG TO PRIME-P
               MOVE Q TO TST
               PERFORM CHECK-PRIME
               MOVE FLAG TO PRIME-Q
               IF PRIME-P = 1 AND PRIME-Q = 1
                   DISPLAY P " + " Q
                   STOP RUN
               END-IF
           END-PERFORM
           STOP RUN.
       CHECK-PRIME.
           MOVE 1 TO FLAG
           IF TST < 2 MOVE 0 TO FLAG END-IF
           PERFORM VARYING D FROM 2 BY 1 UNTIL D * D > TST
               IF FUNCTION MOD(TST, D) = 0 MOVE 0 TO FLAG END-IF
           END-PERFORM.
