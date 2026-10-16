       IDENTIFICATION DIVISION.
       PROGRAM-ID. LEVEL88FLAGS.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 ORDER-STATUS  PIC X VALUE "N".
          88 STATUS-NEW       VALUE "N".
          88 STATUS-SHIPPED   VALUE "S".
          88 STATUS-DONE      VALUE "D" "C".

       PROCEDURE DIVISION.
           IF STATUS-NEW DISPLAY "order is new" END-IF
           SET STATUS-SHIPPED TO TRUE
           DISPLAY "status code now " ORDER-STATUS
           IF NOT STATUS-DONE DISPLAY "not finished yet" END-IF
           MOVE "C" TO ORDER-STATUS
           IF STATUS-DONE DISPLAY "order closed" END-IF
           STOP RUN.
