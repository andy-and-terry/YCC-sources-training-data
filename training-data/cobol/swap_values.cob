       IDENTIFICATION DIVISION.
       PROGRAM-ID. SWAPVALUES.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 A    PIC 9(3) VALUE 17.
       01 B    PIC 9(3) VALUE 42.
       01 TMP  PIC 9(3).

       PROCEDURE DIVISION.
           DISPLAY "Before: A=" A " B=" B
           MOVE A TO TMP
           MOVE B TO A
           MOVE TMP TO B
           DISPLAY "After:  A=" A " B=" B
           STOP RUN.
