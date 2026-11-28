       IDENTIFICATION DIVISION.
       PROGRAM-ID. POPCOUNT.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 N     PIC 9(5) VALUE 183.
       01 BITS  PIC 99 VALUE 0.

       PROCEDURE DIVISION.
           PERFORM UNTIL N = 0
               IF FUNCTION MOD(N, 2) = 1
                   ADD 1 TO BITS
               END-IF
               DIVIDE 2 INTO N
           END-PERFORM
           DISPLAY "SET BITS = " BITS
           STOP RUN.
