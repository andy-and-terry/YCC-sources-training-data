       IDENTIFICATION DIVISION.
       PROGRAM-ID. KNAPSACK01.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 NUM-ITEMS PIC 9(1) VALUE 4.
       01 CAPACITY PIC 9(2) VALUE 7.
       01 WEIGHT-TABLE.
           05 ITEM-WEIGHT PIC 9(2) OCCURS 4 TIMES.
       01 VALUE-TABLE.
           05 ITEM-VALUE PIC 9(2) OCCURS 4 TIMES.
       01 DP-TABLE.
           05 DP-ROW OCCURS 5 TIMES.
               10 DP-CELL PIC 9(3) OCCURS 8 TIMES VALUE 0.
       01 I PIC 9(2).
       01 J PIC 9(2).
       01 CANDIDATE PIC 9(3).

       PROCEDURE DIVISION.
           MOVE 1 TO ITEM-WEIGHT(1)
           MOVE 3 TO ITEM-WEIGHT(2)
           MOVE 4 TO ITEM-WEIGHT(3)
           MOVE 5 TO ITEM-WEIGHT(4)
           MOVE 1 TO ITEM-VALUE(1)
           MOVE 4 TO ITEM-VALUE(2)
           MOVE 5 TO ITEM-VALUE(3)
           MOVE 7 TO ITEM-VALUE(4)

           PERFORM VARYING I FROM 1 BY 1 UNTIL I > NUM-ITEMS
               PERFORM VARYING J FROM 0 BY 1 UNTIL J > CAPACITY
                   MOVE DP-CELL(I, J + 1) TO DP-CELL(I + 1, J + 1)
                   IF ITEM-WEIGHT(I) NOT > J
                       COMPUTE CANDIDATE =
                           DP-CELL(I, J - ITEM-WEIGHT(I) + 1)
                           + ITEM-VALUE(I)
                       IF CANDIDATE > DP-CELL(I + 1, J + 1)
                           MOVE CANDIDATE TO DP-CELL(I + 1, J + 1)
                       END-IF
                   END-IF
               END-PERFORM
           END-PERFORM

           DISPLAY "MAX VALUE: " DP-CELL(NUM-ITEMS + 1, CAPACITY + 1)
           STOP RUN.
