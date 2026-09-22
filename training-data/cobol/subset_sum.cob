       IDENTIFICATION DIVISION.
       PROGRAM-ID. SUBSETSUM.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 N PIC 9(2) VALUE 3.
       01 TARGET-VAL PIC 9(2) VALUE 9.
       01 ITEM-TABLE.
           05 ITEM-VAL PIC 9(2) OCCURS 3 TIMES.
       01 DP-TABLE.
           05 DP-ROW OCCURS 4 TIMES.
               10 DP-CELL PIC X OCCURS 10 TIMES VALUE "N".
       01 I PIC 9(2).
       01 J PIC 9(2).
       01 DIFF PIC 9(2).
       01 RESULT-FLAG PIC X.

       PROCEDURE DIVISION.
           MOVE 3 TO ITEM-VAL(1)
           MOVE 4 TO ITEM-VAL(2)
           MOVE 5 TO ITEM-VAL(3)

           PERFORM VARYING I FROM 0 BY 1 UNTIL I > N
               MOVE "Y" TO DP-CELL(I + 1, 1)
           END-PERFORM

           PERFORM VARYING I FROM 1 BY 1 UNTIL I > N
               PERFORM VARYING J FROM 1 BY 1 UNTIL J > TARGET-VAL
                   MOVE DP-CELL(I, J + 1) TO DP-CELL(I + 1, J + 1)
                   IF ITEM-VAL(I) NOT > J
                       COMPUTE DIFF = J - ITEM-VAL(I)
                       IF DP-CELL(I, DIFF + 1) = "Y"
                           MOVE "Y" TO DP-CELL(I + 1, J + 1)
                       END-IF
                   END-IF
               END-PERFORM
           END-PERFORM

           MOVE DP-CELL(N + 1, TARGET-VAL + 1) TO RESULT-FLAG
           DISPLAY "SUBSET SUM POSSIBLE: " RESULT-FLAG
           STOP RUN.
