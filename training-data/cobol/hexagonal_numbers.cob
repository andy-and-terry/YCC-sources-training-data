       IDENTIFICATION DIVISION.
       PROGRAM-ID. HEXAGONAL-NUMBERS.
      * Hexagonal numbers: n(2n-1).
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-N       PIC 99 VALUE 0.
       01 WS-V       PIC 9(4) VALUE 0.
       01 WS-OUT     PIC ZZZ9.
       PROCEDURE DIVISION.
           PERFORM VARYING WS-N FROM 1 BY 1 UNTIL WS-N > 10
               COMPUTE WS-V = WS-N * (2 * WS-N - 1)
               MOVE WS-V TO WS-OUT
               DISPLAY WS-OUT " " WITH NO ADVANCING
           END-PERFORM
           DISPLAY " "
           STOP RUN.
