       IDENTIFICATION DIVISION.
       PROGRAM-ID. HERON-AREA-DEMO.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-A      PIC 9(3)V99 VALUE 3.
       01 WS-B      PIC 9(3)V99 VALUE 4.
       01 WS-C      PIC 9(3)V99 VALUE 5.
       01 WS-S      PIC 9(4)V9(4).
       01 WS-AREA   PIC 9(6)V99.
       PROCEDURE DIVISION.
       MAIN-PARA.
           COMPUTE WS-S = (WS-A + WS-B + WS-C) / 2
           COMPUTE WS-AREA = FUNCTION SQRT(
                   WS-S * (WS-S - WS-A) * (WS-S - WS-B) * (WS-S - WS-C))
           DISPLAY "AREA = " WS-AREA
           STOP RUN.
