       IDENTIFICATION DIVISION.
       PROGRAM-ID. EMIRP-NUMBERS.
      * Emirps: primes whose digit reversal is a different prime.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-N      PIC 9(4) VALUE 0.
       01 WS-M      PIC 9(4) VALUE 0.
       01 WS-R      PIC 9(4) VALUE 0.
       01 WS-TEST   PIC 9(4) VALUE 0.
       01 WS-D      PIC 9(4) VALUE 0.
       01 WS-PRIME  PIC 9    VALUE 0.
       01 WS-NPRIME PIC 9    VALUE 0.
       PROCEDURE DIVISION.
       MAIN-PARA.
           PERFORM VARYING WS-N FROM 2 BY 1 UNTIL WS-N > 199
               MOVE WS-N TO WS-M
               MOVE 0 TO WS-R
               PERFORM UNTIL WS-M = 0
                   COMPUTE WS-R = WS-R * 10 + FUNCTION MOD(WS-M, 10)
                   COMPUTE WS-M = WS-M / 10
               END-PERFORM
               IF WS-R NOT = WS-N
                   MOVE WS-N TO WS-TEST
                   PERFORM CHECK-PRIME
                   MOVE WS-PRIME TO WS-NPRIME
                   MOVE WS-R TO WS-TEST
                   PERFORM CHECK-PRIME
                   IF WS-NPRIME = 1 AND WS-PRIME = 1
                       DISPLAY WS-N " " WITH NO ADVANCING
                   END-IF
               END-IF
           END-PERFORM
           DISPLAY " "
           STOP RUN.
       CHECK-PRIME.
           MOVE 1 TO WS-PRIME
           IF WS-TEST < 2
               MOVE 0 TO WS-PRIME
           END-IF
           PERFORM VARYING WS-D FROM 2 BY 1
                   UNTIL WS-D * WS-D > WS-TEST OR WS-PRIME = 0
               IF FUNCTION MOD(WS-TEST, WS-D) = 0
                   MOVE 0 TO WS-PRIME
               END-IF
           END-PERFORM.
