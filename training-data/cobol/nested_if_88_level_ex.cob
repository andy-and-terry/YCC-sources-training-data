       IDENTIFICATION DIVISION.
       PROGRAM-ID. LEVEL-88-EX.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-STATUS PIC X VALUE "A".
          88 ACTIVE   VALUE "A".
          88 INACTIVE VALUE "I".
       PROCEDURE DIVISION.
           IF ACTIVE
              DISPLAY "IS ACTIVE"
           END-IF.
           SET INACTIVE TO TRUE.
           IF NOT ACTIVE
              DISPLAY "NOW INACTIVE: " WS-STATUS
           END-IF.
           STOP RUN.
