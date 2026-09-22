       IDENTIFICATION DIVISION.
       PROGRAM-ID. FIZZBUZZ.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 I PIC 9(3) VALUE 1.

       PROCEDURE DIVISION.
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 20
               EVALUATE TRUE
                   WHEN FUNCTION MOD(I, 15) = 0
                       DISPLAY "FIZZBUZZ"
                   WHEN FUNCTION MOD(I, 3) = 0
                       DISPLAY "FIZZ"
                   WHEN FUNCTION MOD(I, 5) = 0
                       DISPLAY "BUZZ"
                   WHEN OTHER
                       DISPLAY I
               END-EVALUATE
           END-PERFORM
           STOP RUN.
