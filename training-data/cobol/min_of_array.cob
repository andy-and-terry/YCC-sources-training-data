       IDENTIFICATION DIVISION.
       PROGRAM-ID. MINOFARRAY.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 ARR.
           05 ARR-ITEM PIC 9(3) OCCURS 6 TIMES.
       01 I PIC 9(2).
       01 MIN-VAL PIC 9(3).

       PROCEDURE DIVISION.
           MOVE 5 TO ARR-ITEM(1)
           MOVE 3 TO ARR-ITEM(2)
           MOVE 8 TO ARR-ITEM(3)
           MOVE 1 TO ARR-ITEM(4)
           MOVE 9 TO ARR-ITEM(5)
           MOVE 2 TO ARR-ITEM(6)
           MOVE ARR-ITEM(1) TO MIN-VAL
           PERFORM VARYING I FROM 2 BY 1 UNTIL I > 6
               IF ARR-ITEM(I) < MIN-VAL
                   MOVE ARR-ITEM(I) TO MIN-VAL
               END-IF
           END-PERFORM
           DISPLAY "MIN: " MIN-VAL
           STOP RUN.
