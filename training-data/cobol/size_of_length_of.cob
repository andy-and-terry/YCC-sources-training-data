       IDENTIFICATION DIVISION.
       PROGRAM-ID. LENGTHOFDEMO.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 REC.
          05 F1   PIC X(12).
          05 F2   PIC 9(5).
          05 F3   PIC S9(7)V99.
       01 TBL.
          05 ENTRY-ITEM PIC X(4) OCCURS 7 TIMES.

       PROCEDURE DIVISION.
           DISPLAY "REC length: " LENGTH OF REC
           DISPLAY "F3 length:  " LENGTH OF F3
           DISPLAY "TBL length: " LENGTH OF TBL
           DISPLAY "one entry:  " LENGTH OF ENTRY-ITEM(1)
           STOP RUN.
