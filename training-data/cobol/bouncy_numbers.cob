       IDENTIFICATION DIVISION.
       PROGRAM-ID. BOUNCY-NUMBERS.
      * Count bouncy numbers (neither increasing nor decreasing
      * digits) below 1000. Expected: 525.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-N      PIC 9(4) VALUE 0.
       01 WS-M      PIC 9(4) VALUE 0.
       01 WS-PREV   PIC 9 VALUE 0.
       01 WS-D      PIC 9 VALUE 0.
       01 WS-INC    PIC 9 VALUE 0.
       01 WS-DEC    PIC 9 VALUE 0.
       01 WS-COUNT  PIC 9(4) VALUE 0.
       PROCEDURE DIVISION.
       MAIN-PARA.
           PERFORM VARYING WS-N FROM 1 BY 1 UNTIL WS-N > 999
               MOVE 1 TO WS-INC
               MOVE 1 TO WS-DEC
               COMPUTE WS-PREV = FUNCTION MOD (WS-N, 10)
               COMPUTE WS-M = WS-N / 10
               PERFORM UNTIL WS-M = 0
                   COMPUTE WS-D = FUNCTION MOD (WS-M, 10)
                   IF WS-D > WS-PREV
                       MOVE 0 TO WS-INC
                   END-IF
                   IF WS-D < WS-PREV
                       MOVE 0 TO WS-DEC
                   END-IF
                   MOVE WS-D TO WS-PREV
                   COMPUTE WS-M = WS-M / 10
               END-PERFORM
               IF WS-INC = 0 AND WS-DEC = 0
                   ADD 1 TO WS-COUNT
               END-IF
           END-PERFORM
           DISPLAY WS-COUNT
           STOP RUN.
