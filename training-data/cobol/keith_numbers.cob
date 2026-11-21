       IDENTIFICATION DIVISION.
       PROGRAM-ID. KEITH-NUMBERS.
      * Keith numbers: n appears in the Fibonacci-like sequence seeded
      * by its digits.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-N      PIC 9(5) VALUE 0.
       01 WS-STR    PIC 9(5) VALUE 0.
       01 WS-SEQ.
          05 WS-S   PIC 9(6) OCCURS 40 TIMES VALUE 0.
       01 WS-K      PIC 99 VALUE 0.
       01 WS-LEN    PIC 99 VALUE 0.
       01 WS-I      PIC 99 VALUE 0.
       01 WS-SUM    PIC 9(6) VALUE 0.
       01 WS-DIG    PIC 9 VALUE 0.
       01 WS-M      PIC 9(5) VALUE 0.
       01 WS-OUT    PIC Z(4)9.
       PROCEDURE DIVISION.
       MAIN-PARA.
           PERFORM VARYING WS-N FROM 10 BY 1 UNTIL WS-N > 1199
               PERFORM LOAD-DIGITS
               PERFORM UNTIL WS-S (WS-LEN) >= WS-N
                   MOVE 0 TO WS-SUM
                   PERFORM VARYING WS-I FROM 0 BY 1 UNTIL WS-I = WS-K
                       ADD WS-S (WS-LEN - WS-I) TO WS-SUM
                   END-PERFORM
                   ADD 1 TO WS-LEN
                   MOVE WS-SUM TO WS-S (WS-LEN)
               END-PERFORM
               IF WS-S (WS-LEN) = WS-N
                   MOVE WS-N TO WS-OUT
                   DISPLAY WS-OUT WITH NO ADVANCING
               END-IF
           END-PERFORM
           DISPLAY " "
           STOP RUN.
       LOAD-DIGITS.
           MOVE 0 TO WS-K
           MOVE WS-N TO WS-M
           PERFORM UNTIL WS-M = 0
               ADD 1 TO WS-K
               COMPUTE WS-M = WS-M / 10
           END-PERFORM
           MOVE WS-K TO WS-LEN
           MOVE WS-N TO WS-M
           PERFORM VARYING WS-I FROM WS-K BY -1 UNTIL WS-I = 0
               COMPUTE WS-DIG = FUNCTION MOD (WS-M, 10)
               MOVE WS-DIG TO WS-S (WS-I)
               COMPUTE WS-M = WS-M / 10
           END-PERFORM.
