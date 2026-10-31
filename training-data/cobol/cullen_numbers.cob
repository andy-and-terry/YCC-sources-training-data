       IDENTIFICATION DIVISION.
       PROGRAM-ID. CULLEN.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 N        PIC 9(2).
       01 POW      PIC 9(9).
       01 RESULT   PIC 9(9).
       PROCEDURE DIVISION.
           PERFORM VARYING N FROM 1 BY 1 UNTIL N > 5
               COMPUTE POW = 2 ** N
               COMPUTE RESULT = N * POW + 1
               DISPLAY N " " RESULT
           END-PERFORM
           STOP RUN.
