       IDENTIFICATION DIVISION.
       PROGRAM-ID. SQRTDEMO.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 N      PIC 9(4).
       01 ROOT   PIC 9(3)V9(4).

       PROCEDURE DIVISION.
           PERFORM VARYING N FROM 1 BY 3 UNTIL N > 20
               COMPUTE ROOT = FUNCTION SQRT(N)
               DISPLAY "sqrt(" N ") = " ROOT
           END-PERFORM
           STOP RUN.
