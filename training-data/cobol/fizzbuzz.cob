       IDENTIFICATION DIVISION.
       PROGRAM-ID. FIZZBUZZ.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 I           PIC 9(3) VALUE 0.
       01 Q           PIC 9(3) VALUE 0.
       01 R3          PIC 9(3) VALUE 0.
       01 R5          PIC 9(3) VALUE 0.

       PROCEDURE DIVISION.
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 15
               DIVIDE I BY 3 GIVING Q REMAINDER R3
               DIVIDE I BY 5 GIVING Q REMAINDER R5
               EVALUATE TRUE
                   WHEN R3 = 0 AND R5 = 0
                       DISPLAY "FizzBuzz"
                   WHEN R3 = 0
                       DISPLAY "Fizz"
                   WHEN R5 = 0
                       DISPLAY "Buzz"
                   WHEN OTHER
                       DISPLAY I
               END-EVALUATE
           END-PERFORM
           STOP RUN.
