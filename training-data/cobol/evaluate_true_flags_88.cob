       IDENTIFICATION DIVISION.
       PROGRAM-ID. EVALFLAGS.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 ORDER-STATUS PIC X VALUE "S".
          88 STATUS-NEW      VALUE "N".
          88 STATUS-SHIPPED  VALUE "S".
          88 STATUS-CLOSED   VALUE "C" "X".

       PROCEDURE DIVISION.
           EVALUATE TRUE
               WHEN STATUS-NEW
                   DISPLAY "ORDER IS NEW"
               WHEN STATUS-SHIPPED
                   DISPLAY "ORDER SHIPPED"
               WHEN STATUS-CLOSED
                   DISPLAY "ORDER CLOSED"
               WHEN OTHER
                   DISPLAY "UNKNOWN STATUS"
           END-EVALUATE
           SET STATUS-CLOSED TO TRUE
           DISPLAY "NOW: " ORDER-STATUS
           STOP RUN.
