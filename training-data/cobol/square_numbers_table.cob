       IDENTIFICATION DIVISION.
       PROGRAM-ID. SQUARETABLE.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 N     PIC 99.
       01 SQ    PIC 9(4).
       01 CUBE  PIC 9(6).

       PROCEDURE DIVISION.
           PERFORM VARYING N FROM 1 BY 1 UNTIL N > 8
               COMPUTE SQ = N ** 2
               COMPUTE CUBE = N ** 3
               DISPLAY N " " SQ " " CUBE
           END-PERFORM
           STOP RUN.
