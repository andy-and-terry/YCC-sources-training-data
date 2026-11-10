       IDENTIFICATION DIVISION.
       PROGRAM-ID. CAKENUMBERS.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 N        PIC 99.
       01 PIECES   PIC 9(4).
       PROCEDURE DIVISION.
           PERFORM VARYING N FROM 0 BY 1 UNTIL N > 9
               COMPUTE PIECES = (N * N * N + 5 * N + 6) / 6
               DISPLAY "CUTS " N " PIECES " PIECES
           END-PERFORM
           STOP RUN.
      * Pieces: 1 2 4 8 15 26 42 64 93 130
