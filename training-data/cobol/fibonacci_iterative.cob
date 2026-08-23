       IDENTIFICATION DIVISION.
       PROGRAM-ID. FIBONACCIITERATIVE.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 A PIC 9(9) VALUE 0.
       01 B PIC 9(9) VALUE 1.
       01 TEMP PIC 9(9).
       01 I PIC 9(2).

       PROCEDURE DIVISION.
           PERFORM VARYING I FROM 0 BY 1 UNTIL I > 10
               DISPLAY A
               COMPUTE TEMP = A + B
               MOVE B TO A
               MOVE TEMP TO B
           END-PERFORM
           STOP RUN.
