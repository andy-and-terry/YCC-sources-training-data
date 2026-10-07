       IDENTIFICATION DIVISION.
       PROGRAM-ID. MEDIANOFARRAY.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 ARR.
           05 ARR-ITEM PIC 9(3) OCCURS 7 TIMES.
       01 I PIC 9(2).
       01 J PIC 9(2).
       01 TEMP-VAL PIC 9(3).
       01 MEDIAN-VALUE PIC 9(3).
       01 MID-POS PIC 9(2) VALUE 4.

       PROCEDURE DIVISION.
           MOVE 42 TO ARR-ITEM(1)
           MOVE 17 TO ARR-ITEM(2)
           MOVE 93 TO ARR-ITEM(3)
           MOVE 8 TO ARR-ITEM(4)
           MOVE 55 TO ARR-ITEM(5)
           MOVE 71 TO ARR-ITEM(6)
           MOVE 30 TO ARR-ITEM(7)

           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 6
               PERFORM VARYING J FROM 1 BY 1 UNTIL J > 7 - I
                   IF ARR-ITEM(J) > ARR-ITEM(J + 1)
                       MOVE ARR-ITEM(J) TO TEMP-VAL
                       MOVE ARR-ITEM(J + 1) TO ARR-ITEM(J)
                       MOVE TEMP-VAL TO ARR-ITEM(J + 1)
                   END-IF
               END-PERFORM
           END-PERFORM

           MOVE ARR-ITEM(MID-POS) TO MEDIAN-VALUE
           DISPLAY "SORTED ARRAY:"
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 7
               DISPLAY ARR-ITEM(I)
           END-PERFORM
           DISPLAY "MEDIAN: " MEDIAN-VALUE
           STOP RUN.
