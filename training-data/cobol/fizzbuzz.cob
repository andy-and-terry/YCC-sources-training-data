       IDENTIFICATION DIVISION.
       PROGRAM-ID. FIZZBUZZ.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 N PIC 9(3).
       01 Q PIC 9(3).
       01 R3 PIC 9(1).
       01 R5 PIC 9(1).

       PROCEDURE DIVISION.
           PERFORM VARYING N FROM 1 BY 1 UNTIL N > 15
               DIVIDE N BY 3 GIVING Q REMAINDER R3
               DIVIDE N BY 5 GIVING Q REMAINDER R5
               EVALUATE TRUE
                   WHEN R3 = 0 AND R5 = 0
                       DISPLAY "FIZZBUZZ"
                   WHEN R3 = 0
                       DISPLAY "FIZZ"
                   WHEN R5 = 0
                       DISPLAY "BUZZ"
                   WHEN OTHER
                       DISPLAY N
               END-EVALUATE
           END-PERFORM
           STOP RUN.
