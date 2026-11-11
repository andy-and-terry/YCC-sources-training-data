      * Square of the sum minus sum of squares for 1..10 (expect 2640)
       IDENTIFICATION DIVISION.
       PROGRAM-ID. SumSquareDifference.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 I        PIC 99.
       01 TOTAL    PIC 9(6) VALUE 0.
       01 SQUARES  PIC 9(6) VALUE 0.
       01 DIFF     PIC 9(8).

       PROCEDURE DIVISION.
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 10
               ADD I TO TOTAL
               COMPUTE SQUARES = SQUARES + I * I
           END-PERFORM
           COMPUTE DIFF = TOTAL * TOTAL - SQUARES
           DISPLAY DIFF
           STOP RUN.
