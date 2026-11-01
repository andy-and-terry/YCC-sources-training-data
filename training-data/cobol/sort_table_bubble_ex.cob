       IDENTIFICATION DIVISION.
       PROGRAM-ID. BUBBLE-SORT-EX.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-ARR.
          05 WS-N PIC 99 OCCURS 5 TIMES.
       01 I PIC 9.
       01 J PIC 9.
       01 TMP PIC 99.
       PROCEDURE DIVISION.
           MOVE 40 TO WS-N(1). MOVE 10 TO WS-N(2). MOVE 50 TO WS-N(3).
           MOVE 20 TO WS-N(4). MOVE 30 TO WS-N(5).
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 4
              PERFORM VARYING J FROM 1 BY 1 UNTIL J > 5 - I
                 IF WS-N(J) > WS-N(J + 1)
                    MOVE WS-N(J) TO TMP
                    MOVE WS-N(J + 1) TO WS-N(J)
                    MOVE TMP TO WS-N(J + 1)
                 END-IF
              END-PERFORM
           END-PERFORM.
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 5
              DISPLAY WS-N(I)
           END-PERFORM.
           STOP RUN.
