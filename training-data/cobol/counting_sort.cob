       IDENTIFICATION DIVISION.
       PROGRAM-ID. COUNTINGSORT.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 ARR.
           05 ARR-ITEM PIC 9(2) OCCURS 8 TIMES.
       01 N PIC 9(2) VALUE 8.
       01 MAX-VAL PIC 9(2) VALUE 9.
       01 COUNTS.
           05 COUNT-CELL PIC 9(2) OCCURS 10 TIMES VALUE 0.
       01 I PIC 9(2).
       01 OUT-IDX PIC 9(2).
       01 VAL PIC 9(2).

       PROCEDURE DIVISION.
           MOVE 4 TO ARR-ITEM(1)
           MOVE 2 TO ARR-ITEM(2)
           MOVE 9 TO ARR-ITEM(3)
           MOVE 6 TO ARR-ITEM(4)
           MOVE 2 TO ARR-ITEM(5)
           MOVE 1 TO ARR-ITEM(6)
           MOVE 9 TO ARR-ITEM(7)
           MOVE 4 TO ARR-ITEM(8)

           PERFORM VARYING I FROM 1 BY 1 UNTIL I > N
               MOVE ARR-ITEM(I) TO VAL
               ADD 1 TO COUNT-CELL(VAL + 1)
           END-PERFORM

           MOVE 1 TO OUT-IDX
           PERFORM VARYING VAL FROM 0 BY 1 UNTIL VAL > MAX-VAL
               PERFORM UNTIL COUNT-CELL(VAL + 1) = 0
                   MOVE VAL TO ARR-ITEM(OUT-IDX)
                   ADD 1 TO OUT-IDX
                   SUBTRACT 1 FROM COUNT-CELL(VAL + 1)
               END-PERFORM
           END-PERFORM

           PERFORM VARYING I FROM 1 BY 1 UNTIL I > N
               DISPLAY ARR-ITEM(I)
           END-PERFORM
           STOP RUN.
