       IDENTIFICATION DIVISION.
       PROGRAM-ID. LATTICE.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 ROW-TABLE.
          05 CELL PIC 9(5) OCCURS 4 TIMES.
       01 K PIC 9.
       01 J PIC 9.
       PROCEDURE DIVISION.
           PERFORM VARYING J FROM 1 BY 1 UNTIL J > 4
               MOVE 1 TO CELL(J)
           END-PERFORM
           PERFORM 3 TIMES
               PERFORM VARYING J FROM 2 BY 1 UNTIL J > 4
                   ADD CELL(J - 1) TO CELL(J)
               END-PERFORM
           END-PERFORM
           DISPLAY CELL(4)
           STOP RUN.
