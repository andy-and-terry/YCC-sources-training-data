       IDENTIFICATION DIVISION.
       PROGRAM-ID. PRACTICAL-NUMBERS.
      * Practical numbers: every m in 1..n is a sum of distinct
      * divisors of n.  REACH(i+1) = 1 when i is a subset sum.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-N      PIC 9(3) VALUE 0.
       01 WS-D      PIC 9(3) VALUE 0.
       01 WS-I      PIC 9(3) VALUE 0.
       01 WS-OK     PIC 9    VALUE 0.
       01 WS-REACH.
          05 WS-R    PIC 9 OCCURS 41 TIMES VALUE 0.
       PROCEDURE DIVISION.
       MAIN-PARA.
           PERFORM VARYING WS-N FROM 1 BY 1 UNTIL WS-N > 40
               PERFORM CHECK-PRACTICAL
               IF WS-OK = 1
                   DISPLAY WS-N " " WITH NO ADVANCING
               END-IF
           END-PERFORM
           DISPLAY " "
           STOP RUN.
       CHECK-PRACTICAL.
           PERFORM VARYING WS-I FROM 1 BY 1 UNTIL WS-I > 41
               MOVE 0 TO WS-R(WS-I)
           END-PERFORM
           MOVE 1 TO WS-R(1)
           PERFORM VARYING WS-D FROM 1 BY 1 UNTIL WS-D > WS-N
               IF FUNCTION MOD(WS-N, WS-D) = 0
                   PERFORM VARYING WS-I FROM WS-N BY -1
                           UNTIL WS-I < WS-D
                       IF WS-R(WS-I - WS-D + 1) = 1
                           MOVE 1 TO WS-R(WS-I + 1)
                       END-IF
                   END-PERFORM
               END-IF
           END-PERFORM
           MOVE 1 TO WS-OK
           PERFORM VARYING WS-I FROM 1 BY 1 UNTIL WS-I > WS-N
               IF WS-R(WS-I + 1) = 0
                   MOVE 0 TO WS-OK
               END-IF
           END-PERFORM.
