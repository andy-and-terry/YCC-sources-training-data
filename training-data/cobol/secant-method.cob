       IDENTIFICATION DIVISION.
       PROGRAM-ID. SECANT-METHOD.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 X0   COMP-2 VALUE 1.0.
       01 X1   COMP-2 VALUE 2.0.
       01 F0   COMP-2.
       01 F1   COMP-2.
       01 NXT  COMP-2.
       01 I    PIC 99.
       01 OUT  PIC 9.9(10).
       PROCEDURE DIVISION.
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 50
               COMPUTE F0 = X0 * X0 - 2
               COMPUTE F1 = X1 * X1 - 2
               IF F1 = F0 EXIT PERFORM END-IF
               COMPUTE NXT = X1 - F1 * (X1 - X0) / (F1 - F0)
               MOVE X1 TO X0
               MOVE NXT TO X1
           END-PERFORM
           MOVE X1 TO OUT
           DISPLAY OUT
           STOP RUN.
