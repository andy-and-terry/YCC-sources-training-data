       IDENTIFICATION DIVISION.
       PROGRAM-ID. ISODDEVEN.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 N PIC 9(4) VALUE 17.

       PROCEDURE DIVISION.
           IF FUNCTION MOD(N, 2) = 0
               DISPLAY "EVEN"
           ELSE
               DISPLAY "ODD"
           END-IF
           STOP RUN.
