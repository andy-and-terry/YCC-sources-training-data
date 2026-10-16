       IDENTIFICATION DIVISION.
       PROGRAM-ID. PERFUNTILEXIT.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 N     PIC 9(5) VALUE 27.
       01 STEPS PIC 999 VALUE 0.

       PROCEDURE DIVISION.
           PERFORM UNTIL N = 1
               IF FUNCTION MOD(N, 2) = 0
                   DIVIDE 2 INTO N
               ELSE
                   COMPUTE N = 3 * N + 1
               END-IF
               ADD 1 TO STEPS
           END-PERFORM
           DISPLAY "Reached 1 after " STEPS " steps"
           STOP RUN.
