       IDENTIFICATION DIVISION.
       PROGRAM-ID. COLLATZ.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 N PIC 9(6) VALUE 27.
       01 STEPS PIC 9(4) VALUE 0.
       01 Q PIC 9(6).
       01 R PIC 9(1).

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
           DISPLAY "STEPS TO REACH 1: " STEPS
           STOP RUN.
