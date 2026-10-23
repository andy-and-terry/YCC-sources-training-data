       IDENTIFICATION DIVISION.
       PROGRAM-ID. TESTAFTER2.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-N PIC 99 VALUE 10.

       PROCEDURE DIVISION.
      * body runs at least once even though the condition is true
           PERFORM WITH TEST AFTER UNTIL WS-N >= 10
               DISPLAY "N IS " WS-N
               ADD 1 TO WS-N
           END-PERFORM
           DISPLAY "FINAL " WS-N
           STOP RUN.
