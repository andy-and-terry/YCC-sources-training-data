       IDENTIFICATION DIVISION.
       PROGRAM-ID. FIZZBUZZ.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 N           PIC 9(3) VALUE 0.
       01 QUOT        PIC 9(3) VALUE 0.
       01 REM3        PIC 9(3) VALUE 0.
       01 REM5        PIC 9(3) VALUE 0.
       01 N-OUT       PIC ZZ9.

       PROCEDURE DIVISION.
           PERFORM VARYING N FROM 1 BY 1 UNTIL N > 15
               DIVIDE N BY 3 GIVING QUOT REMAINDER REM3
               DIVIDE N BY 5 GIVING QUOT REMAINDER REM5
               EVALUATE TRUE
                   WHEN REM3 = 0 AND REM5 = 0
                       DISPLAY "FIZZBUZZ"
                   WHEN REM3 = 0
                       DISPLAY "FIZZ"
                   WHEN REM5 = 0
                       DISPLAY "BUZZ"
                   WHEN OTHER
                       MOVE N TO N-OUT
                       DISPLAY N-OUT
               END-EVALUATE
           END-PERFORM
           STOP RUN.
