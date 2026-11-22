       IDENTIFICATION DIVISION.
       PROGRAM-ID. LAH-NUMBERS.
      * Unsigned Lah numbers L(n, k) = C(n-1, k-1) * n! / k!
      * (row n = 5), using FUNCTION FACTORIAL.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-N      PIC 9(2) VALUE 5.
       01 WS-K      PIC 9(2) VALUE 0.
       01 WS-C      PIC 9(9) VALUE 0.
       01 WS-L      PIC 9(9) VALUE 0.
       PROCEDURE DIVISION.
       MAIN-PARA.
           PERFORM VARYING WS-K FROM 1 BY 1 UNTIL WS-K > WS-N
               COMPUTE WS-C = FUNCTION FACTORIAL(WS-N - 1) /
                   (FUNCTION FACTORIAL(WS-K - 1) *
                    FUNCTION FACTORIAL(WS-N - WS-K))
               COMPUTE WS-L = WS-C * FUNCTION FACTORIAL(WS-N) /
                   FUNCTION FACTORIAL(WS-K)
               DISPLAY WS-L " " WITH NO ADVANCING
           END-PERFORM
           DISPLAY " "
           STOP RUN.
