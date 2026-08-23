       IDENTIFICATION DIVISION.
       PROGRAM-ID. REVERSEARRAY.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 ARR.
           05 ARR-ITEM PIC 9(2) OCCURS 5 TIMES.
       01 LEFT PIC 9(2).
       01 RIGHT PIC 9(2).
       01 TEMP PIC 9(2).
       01 I PIC 9(2).

       PROCEDURE DIVISION.
           MOVE 1 TO ARR-ITEM(1)
           MOVE 2 TO ARR-ITEM(2)
           MOVE 3 TO ARR-ITEM(3)
           MOVE 4 TO ARR-ITEM(4)
           MOVE 5 TO ARR-ITEM(5)
           MOVE 1 TO LEFT
           MOVE 5 TO RIGHT
           PERFORM UNTIL LEFT >= RIGHT
               MOVE ARR-ITEM(LEFT) TO TEMP
               MOVE ARR-ITEM(RIGHT) TO ARR-ITEM(LEFT)
               MOVE TEMP TO ARR-ITEM(RIGHT)
               ADD 1 TO LEFT
               SUBTRACT 1 FROM RIGHT
           END-PERFORM
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 5
               DISPLAY ARR-ITEM(I)
           END-PERFORM
           STOP RUN.
