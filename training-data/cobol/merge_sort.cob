       IDENTIFICATION DIVISION.
       PROGRAM-ID. MERGESORT.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 N PIC 9(2) VALUE 8.
       01 ARR.
           05 ARR-ITEM PIC 9(3) OCCURS 8 TIMES.
       01 TEMP-ARR.
           05 TEMP-ITEM PIC 9(3) OCCURS 8 TIMES.
       01 WIDTH PIC 9(2).
       01 LEFT-START PIC 9(2).
       01 MID PIC 9(2).
       01 RIGHT-END PIC 9(2).
       01 I PIC 9(2).
       01 J PIC 9(2).
       01 K PIC 9(2).
       01 OUT-IDX PIC 9(2).

       PROCEDURE DIVISION.
           MOVE 50 TO ARR-ITEM(1)
           MOVE 20 TO ARR-ITEM(2)
           MOVE 90 TO ARR-ITEM(3)
           MOVE 10 TO ARR-ITEM(4)
           MOVE 40 TO ARR-ITEM(5)
           MOVE 60 TO ARR-ITEM(6)
           MOVE 30 TO ARR-ITEM(7)
           MOVE 80 TO ARR-ITEM(8)

           MOVE 1 TO WIDTH
           PERFORM UNTIL WIDTH >= N
               MOVE 1 TO LEFT-START
               PERFORM UNTIL LEFT-START > N
                   COMPUTE MID = LEFT-START + WIDTH - 1
                   IF MID > N
                       MOVE N TO MID
                   END-IF
                   COMPUTE RIGHT-END = LEFT-START + (2 * WIDTH) - 1
                   IF RIGHT-END > N
                       MOVE N TO RIGHT-END
                   END-IF
                   PERFORM MERGE-RUNS
                   COMPUTE LEFT-START = LEFT-START + (2 * WIDTH)
               END-PERFORM
               COMPUTE WIDTH = WIDTH * 2
           END-PERFORM

           MOVE 1 TO OUT-IDX
           PERFORM UNTIL OUT-IDX > N
               DISPLAY ARR-ITEM(OUT-IDX)
               ADD 1 TO OUT-IDX
           END-PERFORM
           STOP RUN.

       MERGE-RUNS.
           MOVE LEFT-START TO I
           COMPUTE J = MID + 1
           MOVE LEFT-START TO K
           PERFORM UNTIL I > MID OR J > RIGHT-END
               IF ARR-ITEM(I) <= ARR-ITEM(J)
                   MOVE ARR-ITEM(I) TO TEMP-ITEM(K)
                   ADD 1 TO I
               ELSE
                   MOVE ARR-ITEM(J) TO TEMP-ITEM(K)
                   ADD 1 TO J
               END-IF
               ADD 1 TO K
           END-PERFORM
           PERFORM UNTIL I > MID
               MOVE ARR-ITEM(I) TO TEMP-ITEM(K)
               ADD 1 TO I
               ADD 1 TO K
           END-PERFORM
           PERFORM UNTIL J > RIGHT-END
               MOVE ARR-ITEM(J) TO TEMP-ITEM(K)
               ADD 1 TO J
               ADD 1 TO K
           END-PERFORM
           MOVE LEFT-START TO K
           PERFORM UNTIL K > RIGHT-END
               MOVE TEMP-ITEM(K) TO ARR-ITEM(K)
               ADD 1 TO K
           END-PERFORM.
