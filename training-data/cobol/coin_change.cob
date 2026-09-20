       IDENTIFICATION DIVISION.
       PROGRAM-ID. COINCHANGE.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 NUM-COINS PIC 9(1) VALUE 3.
       01 COIN-TABLE.
           05 COIN-VAL PIC 9(2) OCCURS 3 TIMES.
       01 TARGET-AMT PIC 9(2) VALUE 6.
       01 DP-TABLE.
           05 DP-VAL PIC 9(3) OCCURS 7 TIMES.
       01 J PIC 9(2).
       01 K PIC 9(1).
       01 CANDIDATE PIC 9(3).

       PROCEDURE DIVISION.
           MOVE 1 TO COIN-VAL(1)
           MOVE 3 TO COIN-VAL(2)
           MOVE 4 TO COIN-VAL(3)

           MOVE 0 TO DP-VAL(1)
           PERFORM VARYING J FROM 1 BY 1 UNTIL J > TARGET-AMT
               MOVE 99 TO DP-VAL(J + 1)
               PERFORM VARYING K FROM 1 BY 1 UNTIL K > NUM-COINS
                   IF COIN-VAL(K) NOT > J
                       COMPUTE CANDIDATE =
                           DP-VAL(J - COIN-VAL(K) + 1) + 1
                       IF CANDIDATE < DP-VAL(J + 1)
                           MOVE CANDIDATE TO DP-VAL(J + 1)
                       END-IF
                   END-IF
               END-PERFORM
           END-PERFORM

           DISPLAY "MIN COINS: " DP-VAL(TARGET-AMT + 1)
           STOP RUN.
