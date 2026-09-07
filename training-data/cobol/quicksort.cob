       IDENTIFICATION DIVISION.
       PROGRAM-ID. QUICKSORT.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 ARR.
           05 ARR-ITEM PIC 9(3) OCCURS 8 TIMES.
       01 STACK-LOW PIC 9(2) OCCURS 12 TIMES.
       01 STACK-HIGH PIC 9(2) OCCURS 12 TIMES.
       01 TOP PIC 9(2) VALUE 0.
       01 LOW PIC 9(2).
       01 HIGH PIC 9(2).
       01 I PIC 9(2).
       01 J PIC 9(2).
       01 PIVOT-VAL PIC 9(3).
       01 PIVOT-INDEX PIC 9(2).
       01 TEMP PIC 9(3).

       PROCEDURE DIVISION.
           MOVE 8 TO ARR-ITEM(1)
           MOVE 3 TO ARR-ITEM(2)
           MOVE 5 TO ARR-ITEM(3)
           MOVE 1 TO ARR-ITEM(4)
           MOVE 9 TO ARR-ITEM(5)
           MOVE 2 TO ARR-ITEM(6)
           MOVE 7 TO ARR-ITEM(7)
           MOVE 4 TO ARR-ITEM(8)
           ADD 1 TO TOP
           MOVE 1 TO STACK-LOW(TOP)
           MOVE 8 TO STACK-HIGH(TOP)
           PERFORM UNTIL TOP = 0
               MOVE STACK-LOW(TOP) TO LOW
               MOVE STACK-HIGH(TOP) TO HIGH
               SUBTRACT 1 FROM TOP
               IF LOW < HIGH
                   MOVE ARR-ITEM(HIGH) TO PIVOT-VAL
                   MOVE LOW TO I
                   SUBTRACT 1 FROM I
                   PERFORM VARYING J FROM LOW BY 1 UNTIL J > HIGH - 1
                       IF ARR-ITEM(J) <= PIVOT-VAL
                           ADD 1 TO I
                           MOVE ARR-ITEM(I) TO TEMP
                           MOVE ARR-ITEM(J) TO ARR-ITEM(I)
                           MOVE TEMP TO ARR-ITEM(J)
                       END-IF
                   END-PERFORM
                   ADD 1 TO I
                   MOVE ARR-ITEM(I) TO TEMP
                   MOVE ARR-ITEM(HIGH) TO ARR-ITEM(I)
                   MOVE TEMP TO ARR-ITEM(HIGH)
                   MOVE I TO PIVOT-INDEX
                   IF PIVOT-INDEX > LOW + 1
                       ADD 1 TO TOP
                       MOVE LOW TO STACK-LOW(TOP)
                       COMPUTE STACK-HIGH(TOP) = PIVOT-INDEX - 1
                   END-IF
                   IF PIVOT-INDEX < HIGH - 1
                       ADD 1 TO TOP
                       COMPUTE STACK-LOW(TOP) = PIVOT-INDEX + 1
                       MOVE HIGH TO STACK-HIGH(TOP)
                   END-IF
               END-IF
           END-PERFORM
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 8
               DISPLAY ARR-ITEM(I)
           END-PERFORM
           STOP RUN.
