       IDENTIFICATION DIVISION.
       PROGRAM-ID. AVGSTATS.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 SCORES-AREA.
          05 SCORE  PIC 9(3) OCCURS 5 TIMES.
       01 I        PIC 9.
       01 TOTAL    PIC 9(4) VALUE 0.
       01 AVG      PIC 9(3)V9.

       PROCEDURE DIVISION.
           MOVE 88 TO SCORE(1)  MOVE 92 TO SCORE(2)
           MOVE 79 TO SCORE(3)  MOVE 65 TO SCORE(4)
           MOVE 100 TO SCORE(5)
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 5
               ADD SCORE(I) TO TOTAL
           END-PERFORM
           COMPUTE AVG ROUNDED = TOTAL / 5
           DISPLAY "Total: " TOTAL " Average: " AVG
           DISPLAY "Function mean: " FUNCTION MEAN(SCORE(1) SCORE(2)
               SCORE(3) SCORE(4) SCORE(5))
           STOP RUN.
