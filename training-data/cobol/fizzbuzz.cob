       IDENTIFICATION DIVISION.
       PROGRAM-ID. FIZZBUZZ.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 I           PIC 9(3).
       01 Q           PIC 9(3).
       01 R3          PIC 9.
       01 R5          PIC 9.
       01 I-ED        PIC ZZ9.

       PROCEDURE DIVISION.
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 15
               DIVIDE I BY 3 GIVING Q REMAINDER R3
               DIVIDE I BY 5 GIVING Q REMAINDER R5
               EVALUATE TRUE
                   WHEN R3 = 0 AND R5 = 0
                       DISPLAY "FIZZBUZZ"
                   WHEN R3 = 0
                       DISPLAY "FIZZ"
                   WHEN R5 = 0
                       DISPLAY "BUZZ"
                   WHEN OTHER
                       MOVE I TO I-ED
                       DISPLAY I-ED
               END-EVALUATE
           END-PERFORM
           STOP RUN.
