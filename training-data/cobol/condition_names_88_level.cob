       IDENTIFICATION DIVISION.
       PROGRAM-ID. CONDS.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 STATUS-CODE PIC 99 VALUE 0.
          88 IS-OK        VALUE 0.
          88 IS-WARN      VALUE 1 THRU 9.
          88 IS-FATAL     VALUE 10 THRU 99.
       01 DAY-CODE    PIC 9 VALUE 6.
          88 WEEKEND      VALUE 6 7.
       01 FLAG        PIC X VALUE "N".
          88 FLAG-ON      VALUE "Y".
          88 FLAG-OFF     VALUE "N".
       PROCEDURE DIVISION.
           IF IS-OK DISPLAY "ok" END-IF
           MOVE 5 TO STATUS-CODE
           IF IS-WARN DISPLAY "warning" END-IF
           MOVE 42 TO STATUS-CODE
           EVALUATE TRUE
               WHEN IS-OK    DISPLAY "fine"
               WHEN IS-WARN  DISPLAY "warn"
               WHEN IS-FATAL DISPLAY "fatal"
           END-EVALUATE
           IF WEEKEND DISPLAY "weekend" ELSE DISPLAY "weekday" END-IF
           SET FLAG-ON TO TRUE
           IF FLAG-ON DISPLAY "flag on" END-IF
           SET FLAG-OFF TO TRUE
           IF NOT FLAG-ON AND STATUS-CODE > 10 DISPLAY "off and big" END-IF
           STOP RUN.
