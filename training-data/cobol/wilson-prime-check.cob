       IDENTIFICATION DIVISION.
       PROGRAM-ID. WILSON.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 N PIC 99.
       01 I PIC 99.
       01 F PIC 9(4).
       PROCEDURE DIVISION.
           PERFORM VARYING N FROM 2 BY 1 UNTIL N > 19
               MOVE 1 TO F
               PERFORM VARYING I FROM 2 BY 1 UNTIL I >= N
                   COMPUTE F = FUNCTION MOD(F * I, N)
               END-PERFORM
               IF F = N - 1
                   DISPLAY N " IS PRIME"
               END-IF
           END-PERFORM
           STOP RUN.
