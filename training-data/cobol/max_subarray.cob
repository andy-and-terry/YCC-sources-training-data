       IDENTIFICATION DIVISION.
       PROGRAM-ID. MAXSUBARRAY.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 ARR.
           05 ARR-ITEM PIC S9(3) OCCURS 9 TIMES.
       01 I PIC 9(2).
       01 MAX-SO-FAR PIC S9(4).
       01 MAX-ENDING-HERE PIC S9(4).

       PROCEDURE DIVISION.
           MOVE -2 TO ARR-ITEM(1)
           MOVE 1 TO ARR-ITEM(2)
           MOVE -3 TO ARR-ITEM(3)
           MOVE 4 TO ARR-ITEM(4)
           MOVE -1 TO ARR-ITEM(5)
           MOVE 2 TO ARR-ITEM(6)
           MOVE 1 TO ARR-ITEM(7)
           MOVE -5 TO ARR-ITEM(8)
           MOVE 4 TO ARR-ITEM(9)
           MOVE ARR-ITEM(1) TO MAX-SO-FAR
           MOVE ARR-ITEM(1) TO MAX-ENDING-HERE
           PERFORM VARYING I FROM 2 BY 1 UNTIL I > 9
               IF ARR-ITEM(I) > MAX-ENDING-HERE + ARR-ITEM(I)
                   MOVE ARR-ITEM(I) TO MAX-ENDING-HERE
               ELSE
                   ADD ARR-ITEM(I) TO MAX-ENDING-HERE
               END-IF
               IF MAX-ENDING-HERE > MAX-SO-FAR
                   MOVE MAX-ENDING-HERE TO MAX-SO-FAR
               END-IF
           END-PERFORM
           DISPLAY "MAX: " MAX-SO-FAR
           STOP RUN.
