       IDENTIFICATION DIVISION.
       PROGRAM-ID. TRIANGULAR.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 N     PIC 9(3).
       01 T     PIC 9(5).

       PROCEDURE DIVISION.
           PERFORM VARYING N FROM 1 BY 1 UNTIL N > 10
               COMPUTE T = N * (N + 1) / 2
               DISPLAY N " -> " T
           END-PERFORM
           STOP RUN.
