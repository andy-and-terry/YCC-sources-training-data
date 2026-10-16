       IDENTIFICATION DIVISION.
       PROGRAM-ID. EVALALSO.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 CUSTOMER-TYPE  PIC X VALUE "P".
       01 ORDER-SIZE     PIC 9(4) VALUE 600.
       01 DISCOUNT       PIC 99 VALUE 0.

       PROCEDURE DIVISION.
           EVALUATE CUSTOMER-TYPE ALSO TRUE
               WHEN "P" ALSO ORDER-SIZE > 500
                   MOVE 20 TO DISCOUNT
               WHEN "P" ALSO ANY
                   MOVE 10 TO DISCOUNT
               WHEN "R" ALSO ORDER-SIZE > 500
                   MOVE 5 TO DISCOUNT
               WHEN OTHER
                   MOVE 0 TO DISCOUNT
           END-EVALUATE
           DISPLAY "Discount percent: " DISCOUNT
           STOP RUN.
