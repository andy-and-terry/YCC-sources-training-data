       IDENTIFICATION DIVISION.
       PROGRAM-ID. PERNICIOUS-NUMBERS.
      * Pernicious numbers: the popcount is prime.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-N      PIC 99 VALUE 0.
       01 WS-M      PIC 99 VALUE 0.
       01 WS-C      PIC 99 VALUE 0.
       01 WS-D      PIC 99 VALUE 0.
       01 WS-PRIME  PIC 9 VALUE 0.
       01 WS-OUT    PIC Z9.
       PROCEDURE DIVISION.
       MAIN-PARA.
           PERFORM VARYING WS-N FROM 1 BY 1 UNTIL WS-N > 20
               MOVE WS-N TO WS-M
               MOVE 0 TO WS-C
               PERFORM UNTIL WS-M = 0
                   COMPUTE WS-C = WS-C + FUNCTION MOD (WS-M, 2)
                   COMPUTE WS-M = WS-M / 2
               END-PERFORM
               PERFORM CHECK-PRIME
               IF WS-PRIME = 1
                   MOVE WS-N TO WS-OUT
                   DISPLAY WS-OUT WITH NO ADVANCING
               END-IF
           END-PERFORM.
           DISPLAY " ".
           STOP RUN.
       CHECK-PRIME.
           MOVE 1 TO WS-PRIME
           IF WS-C < 2
               MOVE 0 TO WS-PRIME
           END-IF
           PERFORM VARYING WS-D FROM 2 BY 1
                   UNTIL WS-D * WS-D > WS-C
               IF FUNCTION MOD (WS-C, WS-D) = 0
                   MOVE 0 TO WS-PRIME
               END-IF
           END-PERFORM.
