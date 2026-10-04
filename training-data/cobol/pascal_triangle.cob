       IDENTIFICATION DIVISION.
       PROGRAM-ID. PASCAL.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 ROW-TABLE.
          05 CELL PIC 9(4) OCCURS 10 TIMES VALUE 0.
       01 I     PIC 99.
       01 J     PIC 99.
       01 ROWS  PIC 99 VALUE 6.
       01 SHOWN PIC ZZZ9.

       PROCEDURE DIVISION.
           MOVE 1 TO CELL(1)
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > ROWS
               PERFORM VARYING J FROM I BY -1 UNTIL J < 2
                   ADD CELL(J - 1) TO CELL(J)
               END-PERFORM
               PERFORM VARYING J FROM 1 BY 1 UNTIL J > I
                   MOVE CELL(J) TO SHOWN
                   DISPLAY SHOWN WITH NO ADVANCING
               END-PERFORM
               DISPLAY SPACE
           END-PERFORM
           STOP RUN.
