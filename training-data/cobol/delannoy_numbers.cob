       IDENTIFICATION DIVISION.
       PROGRAM-ID. DELANNOY.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 GRID.
          05 ROW OCCURS 6 TIMES.
             10 CELL PIC 9(6) OCCURS 6 TIMES.
       01 I        PIC 9.
       01 J        PIC 9.
       01 DIAG     PIC 9(6).
       PROCEDURE DIVISION.
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 6
               PERFORM VARYING J FROM 1 BY 1 UNTIL J > 6
                   IF I = 1 OR J = 1
                       MOVE 1 TO CELL(I, J)
                   ELSE
                       COMPUTE CELL(I, J) = CELL(I - 1, J)
                           + CELL(I, J - 1) + CELL(I - 1, J - 1)
                   END-IF
               END-PERFORM
           END-PERFORM
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 6
               MOVE CELL(I, I) TO DIAG
               DISPLAY DIAG
           END-PERFORM
           STOP RUN.
      * Central Delannoy numbers: 000001 000003 000013 000063 000321 001683
