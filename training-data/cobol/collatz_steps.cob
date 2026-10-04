       IDENTIFICATION DIVISION.
       PROGRAM-ID. COLLATZSTEPS.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 START-VALUE PIC 9(9) VALUE 27.
       01 CURRENT-VAL PIC 9(12) VALUE 0.
       01 STEPS       PIC 9(5) VALUE 0.
       01 PEAK        PIC 9(12) VALUE 0.
       01 HALF        PIC 9(12) VALUE 0.
       01 REM2        PIC 9 VALUE 0.

       PROCEDURE DIVISION.
           MOVE START-VALUE TO CURRENT-VAL
           MOVE START-VALUE TO PEAK
           PERFORM UNTIL CURRENT-VAL = 1
               DIVIDE CURRENT-VAL BY 2 GIVING HALF REMAINDER REM2
               IF REM2 = 0
                   MOVE HALF TO CURRENT-VAL
               ELSE
                   COMPUTE CURRENT-VAL = 3 * CURRENT-VAL + 1
               END-IF
               ADD 1 TO STEPS
               IF CURRENT-VAL > PEAK
                   MOVE CURRENT-VAL TO PEAK
               END-IF
           END-PERFORM
           DISPLAY "START: " START-VALUE
           DISPLAY "STEPS: " STEPS
           DISPLAY "PEAK:  " PEAK
           STOP RUN.
