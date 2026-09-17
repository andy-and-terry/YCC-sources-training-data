       IDENTIFICATION DIVISION.
       PROGRAM-ID. LINEARSEARCH.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 ARR.
           05 ARR-ITEM PIC 9(3) OCCURS 7 TIMES.
       01 N PIC 9(2) VALUE 7.
       01 TARGET PIC 9(3) VALUE 42.
       01 I PIC 9(2).
       01 RESULT PIC S9(3) VALUE -1.

       PROCEDURE DIVISION.
           MOVE 15 TO ARR-ITEM(1)
           MOVE 8 TO ARR-ITEM(2)
           MOVE 42 TO ARR-ITEM(3)
           MOVE 23 TO ARR-ITEM(4)
           MOVE 4 TO ARR-ITEM(5)
           MOVE 16 TO ARR-ITEM(6)
           MOVE 99 TO ARR-ITEM(7)

           PERFORM VARYING I FROM 1 BY 1 UNTIL I > N
               IF ARR-ITEM(I) = TARGET
                   MOVE I TO RESULT
                   MOVE N TO I
               END-IF
           END-PERFORM

           IF RESULT = -1
               DISPLAY "NOT FOUND"
           ELSE
               DISPLAY "FOUND AT INDEX: " RESULT
           END-IF
           STOP RUN.
