       IDENTIFICATION DIVISION.
       PROGRAM-ID. COINCHANGE.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 COINS.
           05 COIN-VAL PIC 9(2) OCCURS 3 TIMES.
       01 NUM-COINS PIC 9(1) VALUE 3.
       01 AMOUNT PIC 9(2) VALUE 6.
       01 INF-VAL PIC 9(2) VALUE 99.
       01 DP-TABLE.
           05 DP-CELL PIC 9(2) OCCURS 7 TIMES.
       01 I PIC 9(2).
       01 J PIC 9(2).
       01 CANDIDATE PIC 9(2).

       PROCEDURE DIVISION.
           MOVE 1 TO COIN-VAL(1)
           MOVE 3 TO COIN-VAL(2)
           MOVE 4 TO COIN-VAL(3)

           MOVE 0 TO DP-CELL(1)
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > AMOUNT
               MOVE INF-VAL TO DP-CELL(I + 1)
           END-PERFORM

           PERFORM VARYING I FROM 1 BY 1 UNTIL I > AMOUNT
               PERFORM VARYING J FROM 1 BY 1 UNTIL J > NUM-COINS
                   IF COIN-VAL(J) NOT > I
                       COMPUTE CANDIDATE =
                           DP-CELL(I - COIN-VAL(J) + 1) + 1
                       IF CANDIDATE < DP-CELL(I + 1)
                           MOVE CANDIDATE TO DP-CELL(I + 1)
                       END-IF
                   END-IF
               END-PERFORM
           END-PERFORM

           DISPLAY "MIN COINS: " DP-CELL(AMOUNT + 1)
           STOP RUN.
