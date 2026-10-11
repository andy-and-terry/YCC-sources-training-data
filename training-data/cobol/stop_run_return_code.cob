       IDENTIFICATION DIVISION.
       PROGRAM-ID. RETCODE.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 VALUE-IN PIC 9(3) VALUE 150.

       PROCEDURE DIVISION.
           IF VALUE-IN > 100
               DISPLAY "value too large, setting return code 4"
               MOVE 4 TO RETURN-CODE
           END-IF
           STOP RUN.
