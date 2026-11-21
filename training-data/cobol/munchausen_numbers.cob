       IDENTIFICATION DIVISION.
       PROGRAM-ID. MUNCHAUSEN-NUMBERS.
      * Munchausen numbers: sum of digit^digit equals n
      * (0^0 counted as 0).
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-N      PIC 9(5) VALUE 0.
       01 WS-M      PIC 9(5) VALUE 0.
       01 WS-D      PIC 9 VALUE 0.
       01 WS-SUM    PIC 9(7) VALUE 0.
       01 WS-OUT    PIC Z(4)9.
       PROCEDURE DIVISION.
       MAIN-PARA.
           PERFORM VARYING WS-N FROM 1 BY 1 UNTIL WS-N > 4999
               MOVE WS-N TO WS-M
               MOVE 0 TO WS-SUM
               PERFORM UNTIL WS-M = 0
                   COMPUTE WS-D = FUNCTION MOD (WS-M, 10)
                   IF WS-D > 0
                       COMPUTE WS-SUM = WS-SUM + WS-D ** WS-D
                   END-IF
                   COMPUTE WS-M = WS-M / 10
               END-PERFORM
               IF WS-SUM = WS-N
                   MOVE WS-N TO WS-OUT
                   DISPLAY WS-OUT WITH NO ADVANCING
               END-IF
           END-PERFORM
           DISPLAY " "
           STOP RUN.
