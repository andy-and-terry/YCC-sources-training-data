       IDENTIFICATION DIVISION.
       PROGRAM-ID. COLLATZSTEPS.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 N           PIC 9(9).
       01 START-VAL   PIC 9(9).
       01 STEPS       PIC 9(4) VALUE 0.
       01 QUOT        PIC 9(9).
       01 REM-VAL     PIC 9(1).

       PROCEDURE DIVISION.
           MOVE 27 TO START-VAL
           MOVE START-VAL TO N
           PERFORM UNTIL N = 1
               DIVIDE N BY 2 GIVING QUOT REMAINDER REM-VAL
               IF REM-VAL = 0
                   MOVE QUOT TO N
               ELSE
                   COMPUTE N = 3 * N + 1
               END-IF
               ADD 1 TO STEPS
           END-PERFORM
           DISPLAY "START: " START-VAL " STEPS: " STEPS
           STOP RUN.
