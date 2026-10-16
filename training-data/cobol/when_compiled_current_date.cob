       IDENTIFICATION DIVISION.
       PROGRAM-ID. CURDATE.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 NOW-STAMP.
          05 YYYY   PIC 9(4).
          05 MM     PIC 99.
          05 DD     PIC 99.
          05 HH     PIC 99.
          05 MI     PIC 99.
          05 SS     PIC 99.
          05 FILLER PIC X(7).

       PROCEDURE DIVISION.
           MOVE FUNCTION CURRENT-DATE TO NOW-STAMP
           DISPLAY "Year valid: " WITH NO ADVANCING
           IF YYYY >= 2000
               DISPLAY "yes"
           ELSE
               DISPLAY "no"
           END-IF
           DISPLAY "Month in range: " WITH NO ADVANCING
           IF MM >= 1 AND MM <= 12
               DISPLAY "yes"
           ELSE
               DISPLAY "no"
           END-IF
           STOP RUN.
