       IDENTIFICATION DIVISION.
       PROGRAM-ID. FIZZBUZZ.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 N PIC 9(3).

       PROCEDURE DIVISION.
           PERFORM VARYING N FROM 1 BY 1 UNTIL N > 20
               EVALUATE TRUE
                   WHEN FUNCTION MOD(N, 15) = 0
                       DISPLAY "FIZZBUZZ"
                   WHEN FUNCTION MOD(N, 3) = 0
                       DISPLAY "FIZZ"
                   WHEN FUNCTION MOD(N, 5) = 0
                       DISPLAY "BUZZ"
                   WHEN OTHER
                       DISPLAY N
               END-EVALUATE
           END-PERFORM
           STOP RUN.
