       IDENTIFICATION DIVISION.
       PROGRAM-ID. PENTAGONAL-NUMBERS.
      * Pentagonal numbers: n(3n-1)/2.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-N       PIC 99 VALUE 0.
       01 WS-V       PIC 9(4) VALUE 0.
       01 WS-OUT     PIC ZZZ9.
       PROCEDURE DIVISION.
           PERFORM VARYING WS-N FROM 1 BY 1 UNTIL WS-N > 10
               COMPUTE WS-V = WS-N * (3 * WS-N - 1) / 2
               MOVE WS-V TO WS-OUT
               DISPLAY WS-OUT " " WITH NO ADVANCING
           END-PERFORM
           DISPLAY " "
           STOP RUN.
