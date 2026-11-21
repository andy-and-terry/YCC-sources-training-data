       IDENTIFICATION DIVISION.
       PROGRAM-ID. AMICABLE-PAIRS.
      * Amicable pairs below 1500 via sums of proper divisors.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-A      PIC 9(5) VALUE 0.
       01 WS-B      PIC 9(5) VALUE 0.
       01 WS-N      PIC 9(5) VALUE 0.
       01 WS-D      PIC 9(5) VALUE 0.
       01 WS-T      PIC 9(5) VALUE 0.
       01 WS-OUT-A  PIC Z(4)9.
       01 WS-OUT-B  PIC Z(4)9.
       PROCEDURE DIVISION.
       MAIN-PARA.
           PERFORM VARYING WS-A FROM 2 BY 1 UNTIL WS-A > 1499
               MOVE WS-A TO WS-N
               PERFORM SUM-DIV
               MOVE WS-T TO WS-B
               IF WS-B > WS-A
                   MOVE WS-B TO WS-N
                   PERFORM SUM-DIV
                   IF WS-T = WS-A
                       MOVE WS-A TO WS-OUT-A
                       MOVE WS-B TO WS-OUT-B
                       DISPLAY WS-OUT-A " " WS-OUT-B
                   END-IF
               END-IF
           END-PERFORM
           STOP RUN.
       SUM-DIV.
           MOVE 0 TO WS-T
           PERFORM VARYING WS-D FROM 1 BY 1 UNTIL WS-D >= WS-N
               IF FUNCTION MOD (WS-N, WS-D) = 0
                   ADD WS-D TO WS-T
               END-IF
           END-PERFORM.
