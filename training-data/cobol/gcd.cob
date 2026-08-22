       IDENTIFICATION DIVISION.
       PROGRAM-ID. GCD.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 A           PIC 9(9) VALUE 48.
       01 B           PIC 9(9) VALUE 18.
       01 TEMP        PIC 9(9) VALUE 0.

       PROCEDURE DIVISION.
           PERFORM UNTIL B = 0
               COMPUTE TEMP = FUNCTION MOD(A, B)
               MOVE B TO A
               MOVE TEMP TO B
           END-PERFORM
           DISPLAY "GCD: " A
           STOP RUN.
