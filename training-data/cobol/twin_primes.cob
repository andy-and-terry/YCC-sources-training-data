       IDENTIFICATION DIVISION.
       PROGRAM-ID. TWINPRIMES.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 P        PIC 9(3).
       01 Q        PIC 9(3).
       01 N        PIC 9(3).
       01 D        PIC 9(3).
       01 IS-PRIME PIC 9 VALUE 1.
       01 CHECK-N  PIC 9(3).
       PROCEDURE DIVISION.
           PERFORM VARYING P FROM 3 BY 1 UNTIL P > 78
               COMPUTE Q = P + 2
               MOVE P TO CHECK-N
               PERFORM CHECK-PRIME
               IF IS-PRIME = 1
                   MOVE Q TO CHECK-N
                   PERFORM CHECK-PRIME
                   IF IS-PRIME = 1
                       DISPLAY "(" P "," Q ")"
                   END-IF
               END-IF
           END-PERFORM
           STOP RUN.
       CHECK-PRIME.
           MOVE 1 TO IS-PRIME
           PERFORM VARYING D FROM 2 BY 1 UNTIL D * D > CHECK-N
               IF FUNCTION MOD(CHECK-N, D) = 0
                   MOVE 0 TO IS-PRIME
               END-IF
           END-PERFORM.
      * Prints the pairs (003,005) (005,007) (011,013) ... (071,073)
