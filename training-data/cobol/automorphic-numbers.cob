       IDENTIFICATION DIVISION.
       PROGRAM-ID. AUTOMORPH.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 N        PIC 9(4).
       01 SQ       PIC 9(8).
       01 MODULUS  PIC 9(5).
       01 TAIL     PIC 9(4).

       PROCEDURE DIVISION.
           PERFORM VARYING N FROM 1 BY 1 UNTIL N > 999
               EVALUATE TRUE
                   WHEN N < 10   MOVE 10 TO MODULUS
                   WHEN N < 100  MOVE 100 TO MODULUS
                   WHEN OTHER    MOVE 1000 TO MODULUS
               END-EVALUATE
               COMPUTE SQ = N * N
               COMPUTE TAIL = FUNCTION MOD(SQ, MODULUS)
               IF TAIL = N
                   DISPLAY N
               END-IF
           END-PERFORM
           STOP RUN.
