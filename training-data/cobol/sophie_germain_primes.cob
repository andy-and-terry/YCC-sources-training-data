       IDENTIFICATION DIVISION.
       PROGRAM-ID. SOPHIEGERMAIN.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 P        PIC 9(3).
       01 Q        PIC 9(3).
       01 D        PIC 9(3).
       01 IS-PRIME PIC 9 VALUE 1.
       01 CHECK-N  PIC 9(3).
       01 FOUND    PIC 99 VALUE 0.
       PROCEDURE DIVISION.
           PERFORM VARYING P FROM 2 BY 1 UNTIL FOUND = 10
               MOVE P TO CHECK-N
               PERFORM CHECK-PRIME
               IF IS-PRIME = 1
                   COMPUTE Q = 2 * P + 1
                   MOVE Q TO CHECK-N
                   PERFORM CHECK-PRIME
                   IF IS-PRIME = 1
                       DISPLAY P
                       ADD 1 TO FOUND
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
      * Prints 002 003 005 011 023 029 041 053 083 089, one per line.
