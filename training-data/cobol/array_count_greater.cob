       IDENTIFICATION DIVISION.
       PROGRAM-ID. COUNTGREATER.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 NUMS-AREA.
          05 NUMS   PIC 9(3) OCCURS 8 TIMES.
       01 THRESHOLD PIC 9(3) VALUE 50.
       01 I         PIC 9.
       01 CNT       PIC 9 VALUE 0.

       PROCEDURE DIVISION.
           MOVE 12 TO NUMS(1)  MOVE 75 TO NUMS(2)
           MOVE 50 TO NUMS(3)  MOVE 99 TO NUMS(4)
           MOVE 8  TO NUMS(5)  MOVE 61 TO NUMS(6)
           MOVE 49 TO NUMS(7)  MOVE 51 TO NUMS(8)
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 8
               IF NUMS(I) > THRESHOLD
                   ADD 1 TO CNT
               END-IF
           END-PERFORM
           DISPLAY CNT " values exceed " THRESHOLD
           STOP RUN.
