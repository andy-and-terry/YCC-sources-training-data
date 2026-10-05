       IDENTIFICATION DIVISION.
       PROGRAM-ID. SUM-OF-CUBES.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 I           PIC 9(3) VALUE 0.
       01 CUBE        PIC 9(9) VALUE 0.
       01 TOTAL       PIC 9(9) VALUE 0.

       PROCEDURE DIVISION.
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 10
               COMPUTE CUBE = I ** 3
               ADD CUBE TO TOTAL
           END-PERFORM
           DISPLAY "SUM OF CUBES 1..10: " TOTAL
           STOP RUN.
