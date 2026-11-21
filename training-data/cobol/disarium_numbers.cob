       IDENTIFICATION DIVISION.
       PROGRAM-ID. DISARIUM-NUMBERS.
      * Disarium numbers: digits raised to their 1-based positions
      * sum to n.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-N      PIC 9(4) VALUE 0.
       01 WS-M      PIC 9(4) VALUE 0.
       01 WS-K      PIC 9 VALUE 0.
       01 WS-D      PIC 9 VALUE 0.
       01 WS-SUM    PIC 9(7) VALUE 0.
       01 WS-OUT    PIC Z(3)9.
       PROCEDURE DIVISION.
       MAIN-PARA.
           PERFORM VARYING WS-N FROM 1 BY 1 UNTIL WS-N > 999
               MOVE WS-N TO WS-M
               MOVE 0 TO WS-K
               PERFORM UNTIL WS-M = 0
                   ADD 1 TO WS-K
                   COMPUTE WS-M = WS-M / 10
               END-PERFORM
               MOVE WS-N TO WS-M
               MOVE 0 TO WS-SUM
               PERFORM UNTIL WS-M = 0
                   COMPUTE WS-D = FUNCTION MOD (WS-M, 10)
                   COMPUTE WS-SUM = WS-SUM + WS-D ** WS-K
                   SUBTRACT 1 FROM WS-K
                   COMPUTE WS-M = WS-M / 10
               END-PERFORM
               IF WS-SUM = WS-N
                   MOVE WS-N TO WS-OUT
                   DISPLAY WS-OUT WITH NO ADVANCING
               END-IF
           END-PERFORM
           DISPLAY " "
           STOP RUN.
