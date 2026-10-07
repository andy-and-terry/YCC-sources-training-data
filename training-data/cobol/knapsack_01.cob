       IDENTIFICATION DIVISION.
       PROGRAM-ID. KNAPSACK01.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 N PIC 9(2) VALUE 4.
       01 CAPACITY PIC 9(2) VALUE 7.
       01 WEIGHT-TABLE.
           05 WT PIC 9(2) OCCURS 4 TIMES.
       01 VALUE-TABLE.
           05 VL PIC 9(2) OCCURS 4 TIMES.
       01 DP-TABLE.
           05 DP-ROW OCCURS 5 TIMES.
               10 DP-CELL PIC 9(3) OCCURS 8 TIMES VALUE 0.
       01 I PIC 9(2).
       01 W PIC 9(2).
       01 REDUCED-W PIC 9(2).
       01 CANDIDATE PIC 9(3).

       PROCEDURE DIVISION.
           MOVE 1 TO WT(1)
           MOVE 3 TO WT(2)
           MOVE 4 TO WT(3)
           MOVE 5 TO WT(4)
           MOVE 1 TO VL(1)
           MOVE 4 TO VL(2)
           MOVE 5 TO VL(3)
           MOVE 7 TO VL(4)

           PERFORM VARYING I FROM 1 BY 1 UNTIL I > N
               PERFORM VARYING W FROM 0 BY 1 UNTIL W > CAPACITY
                   IF WT(I) > W
                       MOVE DP-CELL(I, W + 1) TO DP-CELL(I + 1, W + 1)
                   ELSE
                       COMPUTE REDUCED-W = W - WT(I) + 1
                       COMPUTE CANDIDATE =
                           DP-CELL(I, REDUCED-W) + VL(I)
                       IF CANDIDATE > DP-CELL(I, W + 1)
                           MOVE CANDIDATE TO DP-CELL(I + 1, W + 1)
                       ELSE
                           MOVE DP-CELL(I, W + 1)
                               TO DP-CELL(I + 1, W + 1)
                       END-IF
                   END-IF
               END-PERFORM
           END-PERFORM

           DISPLAY "MAX VALUE: " DP-CELL(N + 1, CAPACITY + 1)
           STOP RUN.
