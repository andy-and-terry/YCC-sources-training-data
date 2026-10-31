       IDENTIFICATION DIVISION.
       PROGRAM-ID. ALTDIGIT.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 N        PIC 9(6) VALUE 1234.
       01 TOTAL    PIC S9(4) VALUE 0.
       01 SIGN-V   PIC S9 VALUE 1.
       01 D        PIC 9.
       01 ORIG     PIC 9(6).
       PROCEDURE DIVISION.
           MOVE N TO ORIG
           PERFORM UNTIL N = 0
               COMPUTE D = FUNCTION MOD(N, 10)
               COMPUTE TOTAL = TOTAL + SIGN-V * D
               COMPUTE SIGN-V = 0 - SIGN-V
               COMPUTE N = N / 10
           END-PERFORM
           DISPLAY ORIG " " TOTAL
           STOP RUN.
