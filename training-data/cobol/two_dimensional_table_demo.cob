       IDENTIFICATION DIVISION.
       PROGRAM-ID. TABLE2D.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 GRID.
          05 GRID-ROW OCCURS 3 TIMES.
             10 CELL PIC 99 OCCURS 4 TIMES.
       01 R PIC 9.
       01 C PIC 9.
       01 ROW-TOTAL PIC 999.

       PROCEDURE DIVISION.
           PERFORM VARYING R FROM 1 BY 1 UNTIL R > 3
               PERFORM VARYING C FROM 1 BY 1 UNTIL C > 4
                   COMPUTE CELL(R, C) = R * C
               END-PERFORM
           END-PERFORM
           PERFORM VARYING R FROM 1 BY 1 UNTIL R > 3
               MOVE 0 TO ROW-TOTAL
               PERFORM VARYING C FROM 1 BY 1 UNTIL C > 4
                   ADD CELL(R, C) TO ROW-TOTAL
               END-PERFORM
               DISPLAY "ROW " R " TOTAL: " ROW-TOTAL
           END-PERFORM
           STOP RUN.
