       IDENTIFICATION DIVISION.
       PROGRAM-ID. COLLATZ-STEPS.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 N           PIC 9(9) VALUE 27.
       01 STEPS       PIC 9(5) VALUE 0.
       01 Q           PIC 9(9) VALUE 0.
       01 R           PIC 9(1) VALUE 0.

       PROCEDURE DIVISION.
           PERFORM UNTIL N = 1
               DIVIDE N BY 2 GIVING Q REMAINDER R
               IF R = 0
                   MOVE Q TO N
               ELSE
                   COMPUTE N = 3 * N + 1
               END-IF
               ADD 1 TO STEPS
           END-PERFORM
           DISPLAY "STEPS: " STEPS
           STOP RUN.
