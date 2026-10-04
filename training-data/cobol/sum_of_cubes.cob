       IDENTIFICATION DIVISION.
       PROGRAM-ID. SUMOFCUBES.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 N           PIC 9(3) VALUE 10.
       01 I           PIC 9(3).
       01 CUBE        PIC 9(9).
       01 TOTAL       PIC 9(9) VALUE 0.

       PROCEDURE DIVISION.
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > N
               COMPUTE CUBE = I ** 3
               ADD CUBE TO TOTAL
           END-PERFORM
           DISPLAY "SUM OF CUBES 1.." N ": " TOTAL
           STOP RUN.
