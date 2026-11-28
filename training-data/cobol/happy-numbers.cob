       IDENTIFICATION DIVISION.
       PROGRAM-ID. HAPPYNUM.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 CANDIDATE   PIC 9(4) VALUE 1.
       01 N           PIC 9(4).
       01 SUM-SQ      PIC 9(4).
       01 DIGIT       PIC 9.
       01 ITER        PIC 99.
       01 FOUND       PIC 99 VALUE 0.

       PROCEDURE DIVISION.
           PERFORM UNTIL FOUND = 8
               MOVE CANDIDATE TO N
               MOVE 0 TO ITER
               PERFORM UNTIL N = 1 OR ITER > 20
                   MOVE 0 TO SUM-SQ
                   PERFORM UNTIL N = 0
                       COMPUTE DIGIT = FUNCTION MOD(N, 10)
                       COMPUTE SUM-SQ = SUM-SQ + DIGIT * DIGIT
                       COMPUTE N = N / 10
                   END-PERFORM
                   MOVE SUM-SQ TO N
                   ADD 1 TO ITER
               END-PERFORM
               IF N = 1
                   DISPLAY CANDIDATE
                   ADD 1 TO FOUND
               END-IF
               ADD 1 TO CANDIDATE
           END-PERFORM
           STOP RUN.
