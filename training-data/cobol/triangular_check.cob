       IDENTIFICATION DIVISION.
       PROGRAM-ID. TRIANGULAR-CHECK.
      * N is triangular iff 8N + 1 is a perfect square.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-N     PIC 99 VALUE 0.
       01 WS-S     PIC 9(4) VALUE 0.
       01 WS-R     PIC 9(4) VALUE 0.
       01 WS-OUT   PIC Z9.
       PROCEDURE DIVISION.
       MAIN-PARA.
           PERFORM VARYING WS-N FROM 0 BY 1 UNTIL WS-N > 20
               COMPUTE WS-S = 8 * WS-N + 1
               COMPUTE WS-R = FUNCTION INTEGER (FUNCTION SQRT (WS-S)
                              + 0.5)
               IF WS-R * WS-R = WS-S
                   MOVE WS-N TO WS-OUT
                   DISPLAY WS-OUT WITH NO ADVANCING
               END-IF
           END-PERFORM.
           DISPLAY " ".
           STOP RUN.
