       IDENTIFICATION DIVISION.
       PROGRAM-ID. AMICABLE.
      * Amicable pairs: D(A) = B and D(B) = A with A not = B.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 A     PIC 9(5).
       01 B     PIC 9(5).
       01 N     PIC 9(5).
       01 I     PIC 9(5).
       01 S     PIC 9(6).
       01 DB    PIC 9(6).
       PROCEDURE DIVISION.
           PERFORM VARYING A FROM 2 BY 1 UNTIL A > 1499
               MOVE A TO N
               PERFORM SUM-DIVISORS
               MOVE S TO B
               IF B > A
                   MOVE B TO N
                   PERFORM SUM-DIVISORS
                   MOVE S TO DB
                   IF DB = A
                       DISPLAY A " " B
                   END-IF
               END-IF
           END-PERFORM
           STOP RUN.

       SUM-DIVISORS.
           MOVE 0 TO S
           PERFORM VARYING I FROM 1 BY 1 UNTIL I >= N
               IF FUNCTION MOD(N, I) = 0
                   ADD I TO S
               END-IF
           END-PERFORM.
