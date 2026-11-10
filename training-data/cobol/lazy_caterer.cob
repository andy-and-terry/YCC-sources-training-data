       IDENTIFICATION DIVISION.
       PROGRAM-ID. LAZYCATERER.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 N        PIC 99.
       01 PIECES   PIC 999.
       PROCEDURE DIVISION.
           PERFORM VARYING N FROM 0 BY 1 UNTIL N > 9
               COMPUTE PIECES = (N * N + N + 2) / 2
               DISPLAY "CUTS " N " PIECES " PIECES
           END-PERFORM
           STOP RUN.
      * Pieces: 1 2 4 7 11 16 22 29 37 46
