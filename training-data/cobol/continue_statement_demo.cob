       IDENTIFICATION DIVISION.
       PROGRAM-ID. CONTDEMO.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 N            PIC 99 VALUE 0.
       01 ODD-COUNT    PIC 99 VALUE 0.
       01 EVEN-COUNT   PIC 99 VALUE 0.
       01 BIG-COUNT    PIC 99 VALUE 0.

       PROCEDURE DIVISION.
           PERFORM VARYING N FROM 1 BY 1 UNTIL N > 10
               EVALUATE TRUE
                   WHEN N < 4
      *                small values are deliberately ignored
                       CONTINUE
                   WHEN FUNCTION MOD(N, 2) = 0
                       ADD 1 TO EVEN-COUNT
                   WHEN OTHER
                       ADD 1 TO ODD-COUNT
               END-EVALUATE
               IF N > 8
                   ADD 1 TO BIG-COUNT
               ELSE
                   CONTINUE
               END-IF
           END-PERFORM
           DISPLAY "Even counted (4-10): " EVEN-COUNT
           DISPLAY "Odd counted (5-9):   " ODD-COUNT
           DISPLAY "Values above 8:      " BIG-COUNT
           STOP RUN.
