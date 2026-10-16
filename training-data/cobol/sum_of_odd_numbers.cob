       IDENTIFICATION DIVISION.
       PROGRAM-ID. SUMODD.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 I      PIC 9(3).
       01 TOTAL  PIC 9(6) VALUE 0.

       PROCEDURE DIVISION.
           PERFORM VARYING I FROM 1 BY 2 UNTIL I > 99
               ADD I TO TOTAL
           END-PERFORM
           DISPLAY "Sum of odd numbers below 100: " TOTAL
           STOP RUN.
