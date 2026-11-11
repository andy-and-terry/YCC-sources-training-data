       IDENTIFICATION DIVISION.
       PROGRAM-ID. REPUNITS.
      * Repunits: numbers made only of the digit 1.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 R   PIC 9(9) VALUE 0.
       01 I   PIC 9 VALUE 0.
       PROCEDURE DIVISION.
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 5
               COMPUTE R = R * 10 + 1
               DISPLAY R
           END-PERFORM
           STOP RUN.
