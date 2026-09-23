       IDENTIFICATION DIVISION.
       PROGRAM-ID. RODCUTTING.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 PRICES.
           05 PRICE-VAL PIC 9(2) OCCURS 8 TIMES.
       01 DP.
           05 DP-VAL PIC 9(2) OCCURS 9 TIMES.
       01 ROD-LEN   PIC 9(2) VALUE 8.
       01 ROD-CUT-LEN PIC 9(2).
       01 CUT       PIC 9(2).
       01 BEST      PIC 9(2).
       01 CANDIDATE PIC 9(2).

       PROCEDURE DIVISION.
           MOVE 1  TO PRICE-VAL(1)
           MOVE 5  TO PRICE-VAL(2)
           MOVE 8  TO PRICE-VAL(3)
           MOVE 9  TO PRICE-VAL(4)
           MOVE 10 TO PRICE-VAL(5)
           MOVE 17 TO PRICE-VAL(6)
           MOVE 17 TO PRICE-VAL(7)
           MOVE 20 TO PRICE-VAL(8)

           MOVE 0 TO DP-VAL(1)

           PERFORM VARYING ROD-CUT-LEN FROM 1 BY 1
                   UNTIL ROD-CUT-LEN > ROD-LEN
               MOVE 0 TO BEST
               PERFORM VARYING CUT FROM 1 BY 1 UNTIL CUT > ROD-CUT-LEN
                   COMPUTE CANDIDATE =
                       PRICE-VAL(CUT) + DP-VAL(ROD-CUT-LEN - CUT + 1)
                   IF CANDIDATE > BEST
                       MOVE CANDIDATE TO BEST
                   END-IF
               END-PERFORM
               MOVE BEST TO DP-VAL(ROD-CUT-LEN + 1)
           END-PERFORM

           DISPLAY "MAX REVENUE: " DP-VAL(ROD-LEN + 1)
           STOP RUN.
