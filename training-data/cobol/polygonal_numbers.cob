       IDENTIFICATION DIVISION.
       PROGRAM-ID. POLYGONALNUMBERS.
      * P(s, n) = ((s - 2) * n * n - (s - 4) * n) / 2
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 S PIC 9.
       01 N PIC 99.
       01 P PIC 9(4).
       01 ED PIC Z(3)9.
       01 LABEL-TEXT PIC X(12).
       01 OUT-LINE PIC X(80).
       01 PTR PIC 99.

       PROCEDURE DIVISION.
           MOVE 3 TO S
           MOVE "Triangular:" TO LABEL-TEXT
           PERFORM SHOW-SERIES
           MOVE 5 TO S
           MOVE "Pentagonal:" TO LABEL-TEXT
           PERFORM SHOW-SERIES
           MOVE 6 TO S
           MOVE "Hexagonal:" TO LABEL-TEXT
           PERFORM SHOW-SERIES
           STOP RUN.

       SHOW-SERIES.
           MOVE SPACES TO OUT-LINE
           MOVE 1 TO PTR
           STRING FUNCTION TRIM(LABEL-TEXT) " " DELIMITED BY SIZE
               INTO OUT-LINE WITH POINTER PTR
           PERFORM VARYING N FROM 1 BY 1 UNTIL N > 10
               COMPUTE P = ((S - 2) * N * N - (S - 4) * N) / 2
               MOVE P TO ED
               STRING FUNCTION TRIM(ED) " " DELIMITED BY SIZE
                   INTO OUT-LINE WITH POINTER PTR
           END-PERFORM
           DISPLAY FUNCTION TRIM(OUT-LINE).
