       IDENTIFICATION DIVISION.
       PROGRAM-ID. BINARYSEARCH.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 ARR.
           05 ARR-ITEM PIC 9(3) OCCURS 7 TIMES.
       01 LOW PIC S9(3).
       01 HIGH PIC S9(3).
       01 MID PIC S9(3).
       01 TARGET PIC 9(3) VALUE 7.
       01 RESULT PIC S9(3) VALUE -1.

       PROCEDURE DIVISION.
           MOVE 1 TO ARR-ITEM(1)
           MOVE 3 TO ARR-ITEM(2)
           MOVE 5 TO ARR-ITEM(3)
           MOVE 7 TO ARR-ITEM(4)
           MOVE 9 TO ARR-ITEM(5)
           MOVE 11 TO ARR-ITEM(6)
           MOVE 13 TO ARR-ITEM(7)
           MOVE 1 TO LOW
           MOVE 7 TO HIGH
           PERFORM UNTIL LOW > HIGH
               COMPUTE MID = (LOW + HIGH) / 2
               IF ARR-ITEM(MID) = TARGET
                   MOVE MID TO RESULT
                   MOVE 8 TO LOW
                   MOVE 1 TO HIGH
               ELSE IF ARR-ITEM(MID) < TARGET
                   COMPUTE LOW = MID + 1
               ELSE
                   COMPUTE HIGH = MID - 1
               END-IF
           END-PERFORM
           DISPLAY "RESULT: " RESULT
           STOP RUN.
