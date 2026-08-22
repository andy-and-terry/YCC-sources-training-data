       IDENTIFICATION DIVISION.
       PROGRAM-ID. BUBBLESORT.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 ARR.
           05 ARR-ITEM PIC 9(3) OCCURS 6 TIMES.
       01 I PIC 9(2).
       01 J PIC 9(2).
       01 TEMP PIC 9(3).

       PROCEDURE DIVISION.
           MOVE 5 TO ARR-ITEM(1)
           MOVE 2 TO ARR-ITEM(2)
           MOVE 9 TO ARR-ITEM(3)
           MOVE 1 TO ARR-ITEM(4)
           MOVE 5 TO ARR-ITEM(5)
           MOVE 6 TO ARR-ITEM(6)
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 5
               PERFORM VARYING J FROM 1 BY 1 UNTIL J > 6 - I
                   IF ARR-ITEM(J) > ARR-ITEM(J + 1)
                       MOVE ARR-ITEM(J) TO TEMP
                       MOVE ARR-ITEM(J + 1) TO ARR-ITEM(J)
                       MOVE TEMP TO ARR-ITEM(J + 1)
                   END-IF
               END-PERFORM
           END-PERFORM
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 6
               DISPLAY ARR-ITEM(I)
           END-PERFORM
           STOP RUN.
