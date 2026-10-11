       IDENTIFICATION DIVISION.
       PROGRAM-ID. ABSVALUE.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 X       PIC S9(4) VALUE -275.
       01 ABS-X   PIC 9(4).
       01 SIGN-OF PIC S9.

       PROCEDURE DIVISION.
           COMPUTE ABS-X = FUNCTION ABS(X)
           DISPLAY "X = " X
           DISPLAY "ABS = " ABS-X
           EVALUATE TRUE
               WHEN X < 0 MOVE -1 TO SIGN-OF
               WHEN X = 0 MOVE 0 TO SIGN-OF
               WHEN OTHER MOVE 1 TO SIGN-OF
           END-EVALUATE
           DISPLAY "SIGN = " SIGN-OF
           STOP RUN.
