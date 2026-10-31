       IDENTIFICATION DIVISION.
       PROGRAM-ID. PERSIST.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 N        PIC 9(6) VALUE 999.
       01 ORIG     PIC 9(6).
       01 PROD     PIC 9(9).
       01 STEPS    PIC 9(2) VALUE 0.
       PROCEDURE DIVISION.
           MOVE N TO ORIG
           PERFORM UNTIL N < 10
               MOVE 1 TO PROD
               PERFORM UNTIL N = 0
                   COMPUTE PROD = PROD * FUNCTION MOD(N, 10)
                   COMPUTE N = N / 10
               END-PERFORM
               MOVE PROD TO N
               ADD 1 TO STEPS
           END-PERFORM
           DISPLAY ORIG " " STEPS
           STOP RUN.
