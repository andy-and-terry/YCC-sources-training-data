       IDENTIFICATION DIVISION.
       PROGRAM-ID. TABLESEARCH.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 ARR.
           05 ARR-ITEM PIC 9(2) OCCURS 7 TIMES INDEXED BY IDX.
       01 TARGET PIC 9(2) VALUE 7.

       PROCEDURE DIVISION.
           MOVE 1 TO ARR-ITEM(1)
           MOVE 3 TO ARR-ITEM(2)
           MOVE 5 TO ARR-ITEM(3)
           MOVE 7 TO ARR-ITEM(4)
           MOVE 9 TO ARR-ITEM(5)
           MOVE 11 TO ARR-ITEM(6)
           MOVE 13 TO ARR-ITEM(7)
           SET IDX TO 1
           SEARCH ARR-ITEM
               AT END DISPLAY "NOT FOUND"
               WHEN ARR-ITEM(IDX) = TARGET
                   DISPLAY "FOUND AT: " IDX
           END-SEARCH
           STOP RUN.
