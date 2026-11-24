       IDENTIFICATION DIVISION.
       PROGRAM-ID. MOSER-DE-BRUIJN.
      * Moser-de Bruijn sequence: binary digits of n read in base 4.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-N       PIC 99 VALUE 0.
       01 WS-M       PIC 99 VALUE 0.
       01 WS-PLACE   PIC 9(5) VALUE 0.
       01 WS-RES     PIC 9(5) VALUE 0.
       01 WS-BIT     PIC 9 VALUE 0.
       01 WS-OUT     PIC ZZZZ9.
       PROCEDURE DIVISION.
           PERFORM VARYING WS-N FROM 0 BY 1 UNTIL WS-N > 11
               MOVE WS-N TO WS-M
               MOVE 1 TO WS-PLACE
               MOVE 0 TO WS-RES
               PERFORM UNTIL WS-M = 0
                   COMPUTE WS-BIT = FUNCTION MOD (WS-M, 2)
                   IF WS-BIT = 1
                       ADD WS-PLACE TO WS-RES
                   END-IF
                   COMPUTE WS-M = WS-M / 2
                   COMPUTE WS-PLACE = WS-PLACE * 4
               END-PERFORM
               MOVE WS-RES TO WS-OUT
               DISPLAY WS-OUT " " WITH NO ADVANCING
           END-PERFORM
           DISPLAY " "
           STOP RUN.
