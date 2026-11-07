       IDENTIFICATION DIVISION.
       PROGRAM-ID. ADD-BINARY-STRINGS.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 A-STR       PIC X(5) VALUE "01010".
       01 B-STR       PIC X(5) VALUE "01011".
       01 RESULT      PIC X(6) VALUE SPACES.
       01 I           PIC S9 VALUE 5.
       01 SUM-VAL     PIC 9.
       01 CARRY       PIC 9 VALUE 0.
       01 A-DIGIT     PIC 9.
       01 B-DIGIT     PIC 9.

       PROCEDURE DIVISION.
           PERFORM VARYING I FROM 5 BY -1 UNTIL I < 1
               MOVE A-STR(I:1) TO A-DIGIT
               MOVE B-STR(I:1) TO B-DIGIT
               COMPUTE SUM-VAL = A-DIGIT + B-DIGIT + CARRY
               COMPUTE CARRY = SUM-VAL / 2
               COMPUTE SUM-VAL = FUNCTION MOD(SUM-VAL, 2)
               MOVE SUM-VAL TO RESULT(I + 1:1)
           END-PERFORM
           MOVE CARRY TO RESULT(1:1)
           DISPLAY "RESULT = " RESULT
           STOP RUN.
