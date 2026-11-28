       IDENTIFICATION DIVISION.
       PROGRAM-ID. DEFICIENT.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 N     PIC 99.
       01 D     PIC 99.
       01 SIG   PIC 999.
       01 TWICE PIC 999.

       PROCEDURE DIVISION.
           PERFORM VARYING N FROM 1 BY 1 UNTIL N > 20
               MOVE 0 TO SIG
               PERFORM VARYING D FROM 1 BY 1 UNTIL D > N
                   IF FUNCTION MOD(N, D) = 0
                       ADD D TO SIG
                   END-IF
               END-PERFORM
               COMPUTE TWICE = 2 * N
               IF SIG < TWICE
                   DISPLAY N
               END-IF
           END-PERFORM
           STOP RUN.
