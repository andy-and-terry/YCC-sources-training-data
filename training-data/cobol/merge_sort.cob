       IDENTIFICATION DIVISION.
       PROGRAM-ID. MERGESORT.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 ARR.
           05 ARR-ITEM PIC 9(3) OCCURS 8 TIMES.
       01 TEMP-ARR.
           05 TEMP-ITEM PIC 9(3) OCCURS 8 TIMES.
       01 N PIC 9(2) VALUE 8.
       01 WIDTH PIC 9(2).
       01 LEFT-START PIC 9(2).
       01 MID-POINT PIC 9(2).
       01 RIGHT-END PIC 9(2).
       01 I PIC 9(2).
       01 L-IDX PIC 9(2).
       01 R-IDX PIC 9(2).
       01 OUT-IDX PIC 9(2).

       PROCEDURE DIVISION.
           MOVE 8 TO ARR-ITEM(1)
           MOVE 3 TO ARR-ITEM(2)
           MOVE 5 TO ARR-ITEM(3)
           MOVE 1 TO ARR-ITEM(4)
           MOVE 9 TO ARR-ITEM(5)
           MOVE 2 TO ARR-ITEM(6)
           MOVE 7 TO ARR-ITEM(7)
           MOVE 4 TO ARR-ITEM(8)

           MOVE 1 TO WIDTH
           PERFORM UNTIL WIDTH >= N
               MOVE 1 TO LEFT-START
               PERFORM UNTIL LEFT-START > N
                   COMPUTE MID-POINT = LEFT-START + WIDTH - 1
                   IF MID-POINT > N
                       COMPUTE MID-POINT = N
                   END-IF
                   COMPUTE RIGHT-END = LEFT-START + (2 * WIDTH) - 1
                   IF RIGHT-END > N
                       COMPUTE RIGHT-END = N
                   END-IF
                   IF MID-POINT < RIGHT-END
                       PERFORM MERGE-RUNS
                   END-IF
                   COMPUTE LEFT-START = LEFT-START + (2 * WIDTH)
               END-PERFORM
               COMPUTE WIDTH = WIDTH * 2
           END-PERFORM

           PERFORM VARYING I FROM 1 BY 1 UNTIL I > N
               DISPLAY ARR-ITEM(I)
           END-PERFORM
           STOP RUN.

       MERGE-RUNS.
           MOVE LEFT-START TO L-IDX
           COMPUTE R-IDX = MID-POINT + 1
           MOVE LEFT-START TO OUT-IDX
           PERFORM UNTIL L-IDX > MID-POINT OR R-IDX > RIGHT-END
               IF ARR-ITEM(L-IDX) <= ARR-ITEM(R-IDX)
                   MOVE ARR-ITEM(L-IDX) TO TEMP-ITEM(OUT-IDX)
                   ADD 1 TO L-IDX
               ELSE
                   MOVE ARR-ITEM(R-IDX) TO TEMP-ITEM(OUT-IDX)
                   ADD 1 TO R-IDX
               END-IF
               ADD 1 TO OUT-IDX
           END-PERFORM
           PERFORM UNTIL L-IDX > MID-POINT
               MOVE ARR-ITEM(L-IDX) TO TEMP-ITEM(OUT-IDX)
               ADD 1 TO L-IDX
               ADD 1 TO OUT-IDX
           END-PERFORM
           PERFORM UNTIL R-IDX > RIGHT-END
               MOVE ARR-ITEM(R-IDX) TO TEMP-ITEM(OUT-IDX)
               ADD 1 TO R-IDX
               ADD 1 TO OUT-IDX
           END-PERFORM
           PERFORM VARYING I FROM LEFT-START BY 1 UNTIL I > RIGHT-END
               MOVE TEMP-ITEM(I) TO ARR-ITEM(I)
           END-PERFORM.
