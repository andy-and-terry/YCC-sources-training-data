       IDENTIFICATION DIVISION.
       PROGRAM-ID. CANTOR-PAIRING.
      * Cantor pairing function and its inverse.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-X      PIC 9(5) VALUE 3.
       01 WS-Y      PIC 9(5) VALUE 4.
       01 WS-Z      PIC 9(6) VALUE 0.
       01 WS-W      PIC 9(5) VALUE 0.
       01 WS-UX     PIC 9(5) VALUE 0.
       01 WS-UY     PIC 9(5) VALUE 0.
       PROCEDURE DIVISION.
       MAIN-PARA.
           COMPUTE WS-Z = (WS-X + WS-Y) * (WS-X + WS-Y + 1) / 2 + WS-Y
           DISPLAY WS-Z
           MOVE 32 TO WS-Z
           COMPUTE WS-W = (FUNCTION INTEGER (FUNCTION SQRT
               (8 * WS-Z + 1)) - 1) / 2
           COMPUTE WS-UY = WS-Z - WS-W * (WS-W + 1) / 2
           COMPUTE WS-UX = WS-W - WS-UY
           DISPLAY WS-UX " " WS-UY
           STOP RUN.
