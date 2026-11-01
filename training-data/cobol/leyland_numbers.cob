       IDENTIFICATION DIVISION.
       PROGRAM-ID. LEYLAND-NUMBERS.
      * Leyland numbers: X**Y + Y**X for X >= Y >= 2.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-X     PIC 9 VALUE 0.
       01 WS-Y     PIC 9 VALUE 0.
       01 WS-VAL   PIC 9(4) VALUE 0.
       01 WS-OUT   PIC Z(3)9.
       PROCEDURE DIVISION.
       MAIN-PARA.
           PERFORM VARYING WS-X FROM 2 BY 1 UNTIL WS-X > 4
               PERFORM VARYING WS-Y FROM 2 BY 1 UNTIL WS-Y > WS-X
                   COMPUTE WS-VAL = WS-X ** WS-Y + WS-Y ** WS-X
                   MOVE WS-VAL TO WS-OUT
                   DISPLAY WS-OUT WITH NO ADVANCING
               END-PERFORM
           END-PERFORM.
           DISPLAY " ".
           STOP RUN.
