       IDENTIFICATION DIVISION.
       PROGRAM-ID. REFACTORABLE.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 N        PIC 99.
       01 D        PIC 99.
       01 TAU      PIC 99.
       PROCEDURE DIVISION.
           PERFORM VARYING N FROM 1 BY 1 UNTIL N > 59
               MOVE 0 TO TAU
               PERFORM VARYING D FROM 1 BY 1 UNTIL D > N
                   IF FUNCTION MOD(N, D) = 0
                       ADD 1 TO TAU
                   END-IF
               END-PERFORM
               IF FUNCTION MOD(N, TAU) = 0
                   DISPLAY N
               END-IF
           END-PERFORM
           STOP RUN.
      * Prints 01 02 08 09 12 18 24 36 40 56, one per line.
