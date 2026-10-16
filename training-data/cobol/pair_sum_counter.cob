       IDENTIFICATION DIVISION.
       PROGRAM-ID. PAIRSUM.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 NUMS-AREA.
          05 NUMS   PIC 99 OCCURS 6 TIMES.
       01 TARGET    PIC 99 VALUE 10.
       01 I         PIC 9.
       01 J         PIC 9.
       01 SUM-IJ    PIC 999.

       PROCEDURE DIVISION.
           MOVE 1 TO NUMS(1)  MOVE 9 TO NUMS(2)
           MOVE 4 TO NUMS(3)  MOVE 6 TO NUMS(4)
           MOVE 5 TO NUMS(5)  MOVE 5 TO NUMS(6)
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 5
               PERFORM VARYING J FROM I BY 1 UNTIL J > 6
                   IF J > I
                       COMPUTE SUM-IJ = NUMS(I) + NUMS(J)
                       IF SUM-IJ = TARGET
                           DISPLAY NUMS(I) " + " NUMS(J) " = " TARGET
                       END-IF
                   END-IF
               END-PERFORM
           END-PERFORM
           STOP RUN.
