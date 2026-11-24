       IDENTIFICATION DIVISION.
       PROGRAM-ID. FIBBINARY-NUMBERS.
      * Fibbinary numbers: no two adjacent 1 bits.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-N       PIC 99 VALUE 0.
       01 WS-M       PIC 99 VALUE 0.
       01 WS-PREV    PIC 9 VALUE 0.
       01 WS-BIT     PIC 9 VALUE 0.
       01 WS-OK      PIC 9 VALUE 0.
       01 WS-OUT     PIC Z9.
       PROCEDURE DIVISION.
           PERFORM VARYING WS-N FROM 0 BY 1 UNTIL WS-N > 49
               MOVE WS-N TO WS-M
               MOVE 0 TO WS-PREV
               MOVE 1 TO WS-OK
               PERFORM UNTIL WS-M = 0
                   COMPUTE WS-BIT = FUNCTION MOD (WS-M, 2)
                   IF WS-BIT = 1 AND WS-PREV = 1
                       MOVE 0 TO WS-OK
                   END-IF
                   MOVE WS-BIT TO WS-PREV
                   COMPUTE WS-M = WS-M / 2
               END-PERFORM
               IF WS-OK = 1
                   MOVE WS-N TO WS-OUT
                   DISPLAY WS-OUT " " WITH NO ADVANCING
               END-IF
           END-PERFORM
           DISPLAY " "
           STOP RUN.
