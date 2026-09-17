       IDENTIFICATION DIVISION.
       PROGRAM-ID. HEAPSORT.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 ARR.
           05 ARR-ITEM PIC 9(3) OCCURS 8 TIMES.
       01 N PIC 9(2) VALUE 8.
       01 HALF-N PIC 9(2).
       01 I PIC 9(2).
       01 END-IDX PIC 9(2).
       01 HEAP-SIZE PIC 9(2).
       01 ROOT-IDX PIC 9(2).
       01 LEFT-IDX PIC 9(2).
       01 RIGHT-IDX PIC 9(2).
       01 LARGEST-IDX PIC 9(2).
       01 TEMP PIC 9(3).

       PROCEDURE DIVISION.
           MOVE 8 TO ARR-ITEM(1)
           MOVE 3 TO ARR-ITEM(2)
           MOVE 5 TO ARR-ITEM(3)
           MOVE 1 TO ARR-ITEM(4)
           MOVE 9 TO ARR-ITEM(5)
           MOVE 2 TO ARR-ITEM(6)
           MOVE 7 TO ARR-ITEM(7)
           MOVE 4 TO ARR-ITEM(8)

           MOVE N TO HEAP-SIZE
           COMPUTE HALF-N = N / 2
           PERFORM VARYING I FROM HALF-N BY -1 UNTIL I < 1
               MOVE I TO ROOT-IDX
               PERFORM SIFT-DOWN
           END-PERFORM

           PERFORM VARYING END-IDX FROM N BY -1 UNTIL END-IDX < 2
               MOVE ARR-ITEM(1) TO TEMP
               MOVE ARR-ITEM(END-IDX) TO ARR-ITEM(1)
               MOVE TEMP TO ARR-ITEM(END-IDX)
               COMPUTE HEAP-SIZE = END-IDX - 1
               MOVE 1 TO ROOT-IDX
               PERFORM SIFT-DOWN
           END-PERFORM

           PERFORM VARYING I FROM 1 BY 1 UNTIL I > N
               DISPLAY ARR-ITEM(I)
           END-PERFORM
           STOP RUN.

       SIFT-DOWN.
           PERFORM UNTIL 1 = 0
               COMPUTE LEFT-IDX = 2 * ROOT-IDX
               COMPUTE RIGHT-IDX = 2 * ROOT-IDX + 1
               MOVE ROOT-IDX TO LARGEST-IDX
               IF LEFT-IDX <= HEAP-SIZE
                   AND ARR-ITEM(LEFT-IDX) > ARR-ITEM(LARGEST-IDX)
                   MOVE LEFT-IDX TO LARGEST-IDX
               END-IF
               IF RIGHT-IDX <= HEAP-SIZE
                   AND ARR-ITEM(RIGHT-IDX) > ARR-ITEM(LARGEST-IDX)
                   MOVE RIGHT-IDX TO LARGEST-IDX
               END-IF
               IF LARGEST-IDX = ROOT-IDX
                   EXIT PERFORM
               END-IF
               MOVE ARR-ITEM(ROOT-IDX) TO TEMP
               MOVE ARR-ITEM(LARGEST-IDX) TO ARR-ITEM(ROOT-IDX)
               MOVE TEMP TO ARR-ITEM(LARGEST-IDX)
               MOVE LARGEST-IDX TO ROOT-IDX
           END-PERFORM.
