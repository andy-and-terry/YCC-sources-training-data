       IDENTIFICATION DIVISION.
       PROGRAM-ID. KNAPSACK01.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 N PIC 9(2) VALUE 4.
       01 CAPACITY PIC 9(2) VALUE 7.
       01 WEIGHT-TABLE.
           05 WEIGHT-VAL PIC 9(2) OCCURS 4 TIMES.
       01 ITEM-TABLE.
           05 ITEM-VALUE PIC 9(3) OCCURS 4 TIMES.
       01 DP-TABLE.
           05 DP-ROW OCCURS 5 TIMES.
               10 DP-CELL PIC 9(3) OCCURS 8 TIMES.
       01 I PIC 9(2).
       01 J PIC 9(2).
       01 DIFF PIC 9(2).
       01 WITHOUT-ITEM PIC 9(3).
       01 WITH-ITEM PIC 9(3).

       PROCEDURE DIVISION.
           MOVE 1 TO WEIGHT-VAL(1)
           MOVE 1 TO ITEM-VALUE(1)
           MOVE 3 TO WEIGHT-VAL(2)
           MOVE 4 TO ITEM-VALUE(2)
           MOVE 4 TO WEIGHT-VAL(3)
           MOVE 5 TO ITEM-VALUE(3)
           MOVE 5 TO WEIGHT-VAL(4)
           MOVE 7 TO ITEM-VALUE(4)

           PERFORM VARYING I FROM 1 BY 1 UNTIL I > N
               PERFORM VARYING J FROM 0 BY 1 UNTIL J > CAPACITY
                   MOVE DP-CELL(I, J + 1) TO WITHOUT-ITEM
                   MOVE WITHOUT-ITEM TO DP-CELL(I + 1, J + 1)
                   IF WEIGHT-VAL(I) NOT > J
                       COMPUTE DIFF = J - WEIGHT-VAL(I)
                       COMPUTE WITH-ITEM =
                           DP-CELL(I, DIFF + 1) + ITEM-VALUE(I)
                       IF WITH-ITEM > DP-CELL(I + 1, J + 1)
                           MOVE WITH-ITEM TO DP-CELL(I + 1, J + 1)
                       END-IF
                   END-IF
               END-PERFORM
           END-PERFORM

           DISPLAY "MAX VALUE: " DP-CELL(N + 1, CAPACITY + 1)
           STOP RUN.
