       IDENTIFICATION DIVISION.
       PROGRAM-ID. SELECTIONSORT.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 ARR.
           05 ARR-ITEM PIC 9(3) OCCURS 5 TIMES.
       01 I PIC 9(2).
       01 J PIC 9(2).
       01 MIN-IDX PIC 9(2).
       01 TEMP PIC 9(3).

       PROCEDURE DIVISION.
           MOVE 64 TO ARR-ITEM(1)
           MOVE 25 TO ARR-ITEM(2)
           MOVE 12 TO ARR-ITEM(3)
           MOVE 22 TO ARR-ITEM(4)
           MOVE 11 TO ARR-ITEM(5)
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 4
               MOVE I TO MIN-IDX
               PERFORM VARYING J FROM I + 1 BY 1 UNTIL J > 5
                   IF ARR-ITEM(J) < ARR-ITEM(MIN-IDX)
                       MOVE J TO MIN-IDX
                   END-IF
               END-PERFORM
               MOVE ARR-ITEM(I) TO TEMP
               MOVE ARR-ITEM(MIN-IDX) TO ARR-ITEM(I)
               MOVE TEMP TO ARR-ITEM(MIN-IDX)
           END-PERFORM
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 5
               DISPLAY ARR-ITEM(I)
           END-PERFORM
           STOP RUN.
