       IDENTIFICATION DIVISION.
       PROGRAM-ID. CENTERED-SQUARE-NUMBERS.
      * Centered square numbers: n^2 + (n+1)^2.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-N       PIC 99 VALUE 0.
       01 WS-V       PIC 9(4) VALUE 0.
       01 WS-OUT     PIC ZZZ9.
       PROCEDURE DIVISION.
           PERFORM VARYING WS-N FROM 0 BY 1 UNTIL WS-N > 9
               COMPUTE WS-V = WS-N * WS-N + (WS-N + 1) * (WS-N + 1)
               MOVE WS-V TO WS-OUT
               DISPLAY WS-OUT " " WITH NO ADVANCING
           END-PERFORM
           DISPLAY " "
           STOP RUN.
