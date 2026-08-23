       IDENTIFICATION DIVISION.
       PROGRAM-ID. MAXOFTWO.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 A PIC 9(3) VALUE 42.
       01 B PIC 9(3) VALUE 17.
       01 MAX-VAL PIC 9(3).

       PROCEDURE DIVISION.
           IF A > B
               MOVE A TO MAX-VAL
           ELSE
               MOVE B TO MAX-VAL
           END-IF
           DISPLAY "MAX: " MAX-VAL
           STOP RUN.
