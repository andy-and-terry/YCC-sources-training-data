       IDENTIFICATION DIVISION.
       PROGRAM-ID. SHELLSORT.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 ARR.
           05 ARR-ITEM PIC 9(3) OCCURS 8 TIMES.
       01 GAP PIC 9(2).
       01 I PIC 9(2).
       01 J PIC 9(2).
       01 KEY-VAL PIC 9(3).

       PROCEDURE DIVISION.
           MOVE 23 TO ARR-ITEM(1)
           MOVE 1 TO ARR-ITEM(2)
           MOVE 10 TO ARR-ITEM(3)
           MOVE 5 TO ARR-ITEM(4)
           MOVE 2 TO ARR-ITEM(5)
           MOVE 21 TO ARR-ITEM(6)
           MOVE 14 TO ARR-ITEM(7)
           MOVE 7 TO ARR-ITEM(8)
           MOVE 4 TO GAP
           PERFORM UNTIL GAP = 0
               PERFORM VARYING I FROM GAP BY 1 UNTIL I > 7
                   MOVE ARR-ITEM(I + 1) TO KEY-VAL
                   MOVE I TO J
                   PERFORM UNTIL J < GAP
                       OR ARR-ITEM(J - GAP + 1) <= KEY-VAL
                       MOVE ARR-ITEM(J - GAP + 1) TO ARR-ITEM(J + 1)
                       COMPUTE J = J - GAP
                   END-PERFORM
                   COMPUTE ARR-ITEM(J + 1) = KEY-VAL
               END-PERFORM
               COMPUTE GAP = GAP / 2
           END-PERFORM
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 8
               DISPLAY ARR-ITEM(I)
           END-PERFORM
           STOP RUN.
