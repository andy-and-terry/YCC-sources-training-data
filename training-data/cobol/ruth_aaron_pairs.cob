       IDENTIFICATION DIVISION.
       PROGRAM-ID. RUTH-AARON-PAIRS.
      * Consecutive N, N+1 with equal sums of prime factors.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-N      PIC 999 VALUE 0.
       01 WS-ARG    PIC 999 VALUE 0.
       01 WS-M      PIC 999 VALUE 0.
       01 WS-P      PIC 999 VALUE 0.
       01 WS-SUM    PIC 999 VALUE 0.
       01 WS-SUM-A  PIC 999 VALUE 0.
       01 WS-OUT    PIC ZZ9.
       PROCEDURE DIVISION.
       MAIN-PARA.
           PERFORM VARYING WS-N FROM 2 BY 1 UNTIL WS-N > 109
               MOVE WS-N TO WS-ARG
               PERFORM SOPFR
               MOVE WS-SUM TO WS-SUM-A
               COMPUTE WS-ARG = WS-N + 1
               PERFORM SOPFR
               IF WS-SUM = WS-SUM-A
                   MOVE WS-N TO WS-OUT
                   DISPLAY WS-OUT WITH NO ADVANCING
               END-IF
           END-PERFORM.
           DISPLAY " ".
           STOP RUN.
       SOPFR.
           MOVE WS-ARG TO WS-M
           MOVE 0 TO WS-SUM
           MOVE 2 TO WS-P
           PERFORM UNTIL WS-P * WS-P > WS-M
               PERFORM UNTIL FUNCTION MOD (WS-M, WS-P) NOT = 0
                   ADD WS-P TO WS-SUM
                   COMPUTE WS-M = WS-M / WS-P
               END-PERFORM
               ADD 1 TO WS-P
           END-PERFORM
           IF WS-M > 1
               ADD WS-M TO WS-SUM
           END-IF.
