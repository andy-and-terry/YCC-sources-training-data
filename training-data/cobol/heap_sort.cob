       IDENTIFICATION DIVISION.
       PROGRAM-ID. HEAPSORT.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 ARR.
           05 ARR-ITEM PIC 9(3) OCCURS 6 TIMES.
       01 N PIC 9(2) VALUE 6.
       01 HEAP-SIZE PIC 9(2).
       01 I PIC 9(2).
       01 ROOT PIC 9(2).
       01 LARGEST PIC 9(2).
       01 LEFT-IDX PIC 9(2).
       01 RIGHT-IDX PIC 9(2).
       01 TEMP PIC 9(3).
       01 DONE-FLAG PIC X VALUE "N".

       PROCEDURE DIVISION.
           MOVE 5 TO ARR-ITEM(1)
           MOVE 3 TO ARR-ITEM(2)
           MOVE 8 TO ARR-ITEM(3)
           MOVE 4 TO ARR-ITEM(4)
           MOVE 9 TO ARR-ITEM(5)
           MOVE 1 TO ARR-ITEM(6)

           MOVE N TO HEAP-SIZE
           PERFORM VARYING I FROM 3 BY -1 UNTIL I < 1
               MOVE I TO ROOT
               PERFORM SIFT-DOWN
           END-PERFORM

           PERFORM VARYING I FROM N BY -1 UNTIL I < 2
               MOVE ARR-ITEM(1) TO TEMP
               MOVE ARR-ITEM(I) TO ARR-ITEM(1)
               MOVE TEMP TO ARR-ITEM(I)
               COMPUTE HEAP-SIZE = I - 1
               MOVE 1 TO ROOT
               PERFORM SIFT-DOWN
           END-PERFORM

           PERFORM VARYING I FROM 1 BY 1 UNTIL I > N
               DISPLAY ARR-ITEM(I)
           END-PERFORM
           STOP RUN.

       SIFT-DOWN.
           MOVE "N" TO DONE-FLAG
           PERFORM UNTIL DONE-FLAG = "Y"
               MOVE ROOT TO LARGEST
               COMPUTE LEFT-IDX = 2 * ROOT
               COMPUTE RIGHT-IDX = 2 * ROOT + 1
               IF LEFT-IDX <= HEAP-SIZE AND
                       ARR-ITEM(LEFT-IDX) > ARR-ITEM(LARGEST)
                   MOVE LEFT-IDX TO LARGEST
               END-IF
               IF RIGHT-IDX <= HEAP-SIZE AND
                       ARR-ITEM(RIGHT-IDX) > ARR-ITEM(LARGEST)
                   MOVE RIGHT-IDX TO LARGEST
               END-IF
               IF LARGEST = ROOT
                   MOVE "Y" TO DONE-FLAG
               ELSE
                   MOVE ARR-ITEM(ROOT) TO TEMP
                   MOVE ARR-ITEM(LARGEST) TO ARR-ITEM(ROOT)
                   MOVE TEMP TO ARR-ITEM(LARGEST)
                   MOVE LARGEST TO ROOT
               END-IF
           END-PERFORM.
