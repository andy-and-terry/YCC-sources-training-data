       IDENTIFICATION DIVISION.
       PROGRAM-ID. LAZY-CATERER-NUMBERS.
      * Lazy caterer's sequence: max pieces from n straight cuts,
      * n(n+1)/2 + 1.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-N      PIC 9(3) VALUE 0.
       01 WS-P      PIC 9(5) VALUE 0.
       PROCEDURE DIVISION.
       MAIN-PARA.
           PERFORM VARYING WS-N FROM 0 BY 1 UNTIL WS-N > 9
               COMPUTE WS-P = WS-N * (WS-N + 1) / 2 + 1
               DISPLAY WS-P " " WITH NO ADVANCING
           END-PERFORM
           DISPLAY " "
           STOP RUN.
