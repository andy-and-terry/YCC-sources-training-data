       IDENTIFICATION DIVISION.
       PROGRAM-ID. SEARCHALLDEMO.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 ARR.
           05 ARR-ITEM PIC 9(3) OCCURS 7 TIMES
               ASCENDING KEY IS ARR-ITEM
               INDEXED BY IDX.
       01 TARGET PIC 9(3) VALUE 40.

       PROCEDURE DIVISION.
           MOVE 5 TO ARR-ITEM(1)
           MOVE 15 TO ARR-ITEM(2)
           MOVE 25 TO ARR-ITEM(3)
           MOVE 40 TO ARR-ITEM(4)
           MOVE 55 TO ARR-ITEM(5)
           MOVE 70 TO ARR-ITEM(6)
           MOVE 90 TO ARR-ITEM(7)
           SEARCH ALL ARR-ITEM
               AT END DISPLAY "NOT FOUND"
               WHEN ARR-ITEM(IDX) = TARGET
                   DISPLAY "FOUND AT: " IDX
           END-SEARCH
           STOP RUN.
