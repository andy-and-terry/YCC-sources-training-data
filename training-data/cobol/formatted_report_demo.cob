       IDENTIFICATION DIVISION.
       PROGRAM-ID. FORMATTEDREPORT.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 ITEM-TABLE.
           05 ITEM-ENTRY OCCURS 3 TIMES.
               10 ITEM-NAME PIC X(12).
               10 ITEM-PRICE PIC 9(4)V99.
       01 EDITED-PRICE PIC $$$$9.99.
       01 TOTAL-PRICE PIC 9(5)V99 VALUE 0.
       01 EDITED-TOTAL PIC $$$,$$9.99.
       01 I PIC 9(2).

       PROCEDURE DIVISION.
           MOVE "WIDGET" TO ITEM-NAME(1)
           MOVE 12.50 TO ITEM-PRICE(1)
           MOVE "GADGET" TO ITEM-NAME(2)
           MOVE 45.00 TO ITEM-PRICE(2)
           MOVE "GIZMO" TO ITEM-NAME(3)
           MOVE 7.25 TO ITEM-PRICE(3)

           DISPLAY "ITEM NAME    PRICE"
           DISPLAY "------------ --------"
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 3
               MOVE ITEM-PRICE(I) TO EDITED-PRICE
               DISPLAY ITEM-NAME(I) " " EDITED-PRICE
               ADD ITEM-PRICE(I) TO TOTAL-PRICE
           END-PERFORM
           DISPLAY "------------ --------"
           MOVE TOTAL-PRICE TO EDITED-TOTAL
           DISPLAY "TOTAL:       " EDITED-TOTAL
           STOP RUN.
