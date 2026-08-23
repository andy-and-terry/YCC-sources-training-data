       IDENTIFICATION DIVISION.
       PROGRAM-ID. TWOSUM.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 ARR.
           05 ARR-ITEM PIC 9(3) OCCURS 4 TIMES.
       01 TARGET PIC 9(3) VALUE 9.
       01 I PIC 9(2).
       01 J PIC 9(2).

       PROCEDURE DIVISION.
           MOVE 2 TO ARR-ITEM(1)
           MOVE 7 TO ARR-ITEM(2)
           MOVE 11 TO ARR-ITEM(3)
           MOVE 15 TO ARR-ITEM(4)
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 4
               PERFORM VARYING J FROM I + 1 BY 1 UNTIL J > 4
                   IF ARR-ITEM(I) + ARR-ITEM(J) = TARGET
                       DISPLAY I " " J
                   END-IF
               END-PERFORM
           END-PERFORM
           STOP RUN.
