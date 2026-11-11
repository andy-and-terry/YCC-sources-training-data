      * Square pyramidal numbers n(n+1)(2n+1)/6
       IDENTIFICATION DIVISION.
       PROGRAM-ID. SquarePyramidalNumbers.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 N      PIC 9(4).
       01 RESULT PIC 9(8).

       PROCEDURE DIVISION.
           PERFORM VARYING N FROM 0 BY 1 UNTIL N > 9
               COMPUTE RESULT = ((n * (n + 1)) * ((2 * n) + 1)) / 6
               DISPLAY RESULT
           END-PERFORM
           STOP RUN.
