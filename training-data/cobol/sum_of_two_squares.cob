       IDENTIFICATION DIVISION.
       PROGRAM-ID. SUM-OF-TWO-SQUARES.
      * Positive N expressible as A*A + B*B with A, B >= 0.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-N     PIC 99 VALUE 0.
       01 WS-A     PIC 99 VALUE 0.
       01 WS-B     PIC 99 VALUE 0.
       01 WS-FOUND PIC 9 VALUE 0.
       01 WS-OUT   PIC Z9.
       PROCEDURE DIVISION.
       MAIN-PARA.
           PERFORM VARYING WS-N FROM 1 BY 1 UNTIL WS-N > 30
               MOVE 0 TO WS-FOUND
               PERFORM VARYING WS-A FROM 0 BY 1 UNTIL WS-A > 6
                   PERFORM VARYING WS-B FROM WS-A BY 1 UNTIL WS-B > 6
                       IF WS-A * WS-A + WS-B * WS-B = WS-N
                           MOVE 1 TO WS-FOUND
                       END-IF
                   END-PERFORM
               END-PERFORM
               IF WS-FOUND = 1
                   MOVE WS-N TO WS-OUT
                   DISPLAY WS-OUT WITH NO ADVANCING
               END-IF
           END-PERFORM.
           DISPLAY " ".
           STOP RUN.
