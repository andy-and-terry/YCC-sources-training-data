       IDENTIFICATION DIVISION.
       PROGRAM-ID. COINCHANGE.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 NUM-COINS PIC 9(1) VALUE 3.
       01 COIN-TABLE.
           05 COIN-VAL PIC 9(2) OCCURS 3 TIMES.
       01 TARGET-AMOUNT PIC 9(2) VALUE 11.
       01 DP-TABLE.
           05 DP-CELL PIC 9(2) OCCURS 12 TIMES VALUE 99.
       01 I PIC 9(2).
       01 A PIC 9(2).
       01 CANDIDATE PIC 9(2).
       01 REDUCED-A PIC 9(2).

       PROCEDURE DIVISION.
           MOVE 1 TO COIN-VAL(1)
           MOVE 2 TO COIN-VAL(2)
           MOVE 5 TO COIN-VAL(3)

           MOVE 0 TO DP-CELL(1)

           PERFORM VARYING A FROM 1 BY 1 UNTIL A > TARGET-AMOUNT
               PERFORM VARYING I FROM 1 BY 1 UNTIL I > NUM-COINS
                   IF COIN-VAL(I) NOT > A
                       COMPUTE REDUCED-A = A - COIN-VAL(I) + 1
                       IF DP-CELL(REDUCED-A) NOT = 99
                           COMPUTE CANDIDATE = DP-CELL(REDUCED-A) + 1
                           IF CANDIDATE < DP-CELL(A + 1)
                               MOVE CANDIDATE TO DP-CELL(A + 1)
                           END-IF
                       END-IF
                   END-IF
               END-PERFORM
           END-PERFORM

           DISPLAY "MIN COINS FOR " TARGET-AMOUNT ": "
               DP-CELL(TARGET-AMOUNT + 1)
           STOP RUN.
