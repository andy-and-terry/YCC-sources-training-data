       IDENTIFICATION DIVISION.
       PROGRAM-ID. RUNNINGMAXTABLE.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 ARR.
           05 ARR-ITEM PIC S9(3) OCCURS 7 TIMES
               VALUES 3 -1 4 1 5 9 2.
       01 RUNNING-MAX.
           05 MAX-ITEM PIC S9(3) OCCURS 7 TIMES.
       01 I PIC 9(1).

       PROCEDURE DIVISION.
           MOVE ARR-ITEM(1) TO MAX-ITEM(1)
           PERFORM VARYING I FROM 2 BY 1 UNTIL I > 7
               IF ARR-ITEM(I) > MAX-ITEM(I - 1)
                   MOVE ARR-ITEM(I) TO MAX-ITEM(I)
               ELSE
                   MOVE MAX-ITEM(I - 1) TO MAX-ITEM(I)
               END-IF
           END-PERFORM

           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 7
               DISPLAY "INDEX " I ": " MAX-ITEM(I)
           END-PERFORM
           STOP RUN.
