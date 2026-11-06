       IDENTIFICATION DIVISION.
       PROGRAM-ID. FERMAT.
      * Fermat test base 2 using repeated squaring; 561 fools it.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 N        PIC 9(5).
       01 E        PIC 9(5).
       01 B        PIC 9(9).
       01 RES      PIC 9(9).
       01 TESTS.
          05 T     PIC 9(5) OCCURS 3 TIMES.
       01 IDX      PIC 9.
       PROCEDURE DIVISION.
           MOVE 97 TO T(1)
           MOVE 91 TO T(2)
           MOVE 561 TO T(3)
           PERFORM VARYING IDX FROM 1 BY 1 UNTIL IDX > 3
               MOVE T(IDX) TO N
               COMPUTE E = N - 1
               MOVE 2 TO B
               MOVE 1 TO RES
               PERFORM UNTIL E = 0
                   IF FUNCTION MOD(E, 2) = 1
                       COMPUTE RES = FUNCTION MOD(RES * B, N)
                   END-IF
                   COMPUTE B = FUNCTION MOD(B * B, N)
                   COMPUTE E = E / 2
               END-PERFORM
               IF RES = 1
                   DISPLAY N " true"
               ELSE
                   DISPLAY N " false"
               END-IF
           END-PERFORM
           STOP RUN.
