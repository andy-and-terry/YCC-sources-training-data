       IDENTIFICATION DIVISION.
       PROGRAM-ID. ARRAYFILL.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 BUCKETS.
          05 B    PIC 9(2) OCCURS 5 TIMES.
       01 I       PIC 9.

       PROCEDURE DIVISION.
           MOVE ALL "7" TO BUCKETS
           DISPLAY "after MOVE ALL: " BUCKETS
           INITIALIZE BUCKETS
           DISPLAY "after INITIALIZE: " BUCKETS
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 5
               COMPUTE B(I) = I * 11
           END-PERFORM
           DISPLAY "filled: " BUCKETS
           STOP RUN.
