       IDENTIFICATION DIVISION.
       PROGRAM-ID. PRONIC.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 N        PIC 99.
       01 P        PIC 9(4).
       01 X        PIC 9(4) VALUE 56.
       01 ROOT     PIC 99.

       PROCEDURE DIVISION.
           PERFORM VARYING N FROM 0 BY 1 UNTIL N > 9
               COMPUTE P = N * (N + 1)
               DISPLAY P
           END-PERFORM
           COMPUTE ROOT = FUNCTION INTEGER-PART(FUNCTION SQRT(X))
           COMPUTE P = ROOT * (ROOT + 1)
           IF P = X
               DISPLAY "56 IS PRONIC"
           END-IF
           STOP RUN.
