       IDENTIFICATION DIVISION.
       PROGRAM-ID. CARMICHAEL-NUMBERS.
      * Carmichael numbers via Korselt's criterion: n is squarefree,
      * composite, and p - 1 divides n - 1 for every prime factor p.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-N      PIC 9(5) VALUE 0.
       01 WS-M      PIC 9(5) VALUE 0.
       01 WS-P      PIC 9(5) VALUE 0.
       01 WS-COUNT  PIC 99 VALUE 0.
       01 WS-OK     PIC 9 VALUE 0.
       01 WS-TMP    PIC 9(5) VALUE 0.
       01 WS-OUT    PIC Z(4)9.
       PROCEDURE DIVISION.
       MAIN-PARA.
           PERFORM VARYING WS-N FROM 3 BY 2 UNTIL WS-N > 2999
               PERFORM CHECK-CARMICHAEL
               IF WS-OK = 1 AND WS-COUNT >= 2
                   MOVE WS-N TO WS-OUT
                   DISPLAY WS-OUT WITH NO ADVANCING
               END-IF
           END-PERFORM
           DISPLAY " "
           STOP RUN.
       CHECK-CARMICHAEL.
           MOVE WS-N TO WS-M
           MOVE 2 TO WS-P
           MOVE 0 TO WS-COUNT
           MOVE 1 TO WS-OK
           PERFORM UNTIL WS-P * WS-P > WS-M OR WS-OK = 0
               IF FUNCTION MOD (WS-M, WS-P) = 0
                   COMPUTE WS-M = WS-M / WS-P
                   IF FUNCTION MOD (WS-M, WS-P) = 0
                       MOVE 0 TO WS-OK
                   END-IF
                   COMPUTE WS-TMP = WS-N - 1
                   IF FUNCTION MOD (WS-TMP, WS-P - 1) NOT = 0
                       MOVE 0 TO WS-OK
                   END-IF
                   ADD 1 TO WS-COUNT
               ELSE
                   ADD 1 TO WS-P
               END-IF
           END-PERFORM
           IF WS-OK = 1 AND WS-M > 1
               COMPUTE WS-TMP = WS-N - 1
               IF FUNCTION MOD (WS-TMP, WS-M - 1) NOT = 0
                   MOVE 0 TO WS-OK
               END-IF
               ADD 1 TO WS-COUNT
           END-IF.
