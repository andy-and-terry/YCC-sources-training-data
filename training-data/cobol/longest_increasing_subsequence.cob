       IDENTIFICATION DIVISION.
       PROGRAM-ID. LISDEMO.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 ARR.
           05 ARR-ITEM PIC S9(3) OCCURS 8 TIMES.
       01 DP-LEN.
           05 DP-ITEM PIC 9(2) OCCURS 8 TIMES.
       01 I PIC 9(2).
       01 J PIC 9(2).
       01 BEST PIC 9(2) VALUE 0.

       PROCEDURE DIVISION.
           MOVE 10 TO ARR-ITEM(1)
           MOVE 9  TO ARR-ITEM(2)
           MOVE 2  TO ARR-ITEM(3)
           MOVE 5  TO ARR-ITEM(4)
           MOVE 3  TO ARR-ITEM(5)
           MOVE 7  TO ARR-ITEM(6)
           MOVE 101 TO ARR-ITEM(7)
           MOVE 18 TO ARR-ITEM(8)

           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 8
               MOVE 1 TO DP-ITEM(I)
               PERFORM VARYING J FROM 1 BY 1 UNTIL J >= I
                   IF ARR-ITEM(J) < ARR-ITEM(I)
                       IF DP-ITEM(J) + 1 > DP-ITEM(I)
                           COMPUTE DP-ITEM(I) = DP-ITEM(J) + 1
                       END-IF
                   END-IF
               END-PERFORM
               IF DP-ITEM(I) > BEST
                   MOVE DP-ITEM(I) TO BEST
               END-IF
           END-PERFORM

           DISPLAY "LONGEST INCREASING SUBSEQUENCE: " BEST
           STOP RUN.
