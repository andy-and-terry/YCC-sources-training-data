       IDENTIFICATION DIVISION.
       PROGRAM-ID. EVALRANGES.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 TEMP   PIC S99.
       01 IDX    PIC 9.
       01 TEMPS-AREA.
          05 T   PIC S99 OCCURS 5 TIMES.

       PROCEDURE DIVISION.
           MOVE -5 TO T(1)  MOVE 8 TO T(2)  MOVE 18 TO T(3)
           MOVE 27 TO T(4)  MOVE 36 TO T(5)
           PERFORM VARYING IDX FROM 1 BY 1 UNTIL IDX > 5
               MOVE T(IDX) TO TEMP
               EVALUATE TRUE
                   WHEN TEMP < 0   DISPLAY TEMP " freezing"
                   WHEN TEMP < 10  DISPLAY TEMP " cold"
                   WHEN TEMP < 25  DISPLAY TEMP " mild"
                   WHEN TEMP < 35  DISPLAY TEMP " warm"
                   WHEN OTHER      DISPLAY TEMP " hot"
               END-EVALUATE
           END-PERFORM
           STOP RUN.
