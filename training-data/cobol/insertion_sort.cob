       IDENTIFICATION DIVISION.
       PROGRAM-ID. INSERTIONSORT.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 ARR.
           05 ARR-ITEM PIC 9(3) OCCURS 5 TIMES.
       01 I PIC 9(2).
       01 J PIC 9(2).
       01 KEY-VAL PIC 9(3).

       PROCEDURE DIVISION.
           MOVE 12 TO ARR-ITEM(1)
           MOVE 11 TO ARR-ITEM(2)
           MOVE 13 TO ARR-ITEM(3)
           MOVE 5 TO ARR-ITEM(4)
           MOVE 6 TO ARR-ITEM(5)
           PERFORM VARYING I FROM 2 BY 1 UNTIL I > 5
               MOVE ARR-ITEM(I) TO KEY-VAL
               MOVE I TO J
               SUBTRACT 1 FROM J
               PERFORM UNTIL J < 1 OR ARR-ITEM(J) <= KEY-VAL
                   MOVE ARR-ITEM(J) TO ARR-ITEM(J + 1)
                   SUBTRACT 1 FROM J
               END-PERFORM
               COMPUTE ARR-ITEM(J + 1) = KEY-VAL
           END-PERFORM
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 5
               DISPLAY ARR-ITEM(I)
           END-PERFORM
           STOP RUN.
