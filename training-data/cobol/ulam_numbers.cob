       IDENTIFICATION DIVISION.
       PROGRAM-ID. ULAMNUMBERS.
      * Ulam: smallest number that is a sum of two distinct earlier terms
      * in exactly one way
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 TERMS-TABLE.
           05 TERM PIC 999 OCCURS 15 TIMES VALUE 0.
       01 FOUND PIC 99 VALUE 2.
       01 CAND PIC 999 VALUE 2.
       01 WAYS PIC 99.
       01 A PIC 99.
       01 B PIC 99.
       01 ED PIC Z(2)9.
       01 OUT-LINE PIC X(100) VALUE SPACES.
       01 PTR PIC 999 VALUE 1.

       PROCEDURE DIVISION.
           MOVE 1 TO TERM(1)
           MOVE 2 TO TERM(2)
           PERFORM UNTIL FOUND >= 15
               ADD 1 TO CAND
               MOVE 0 TO WAYS
               PERFORM VARYING A FROM 1 BY 1 UNTIL A > FOUND
                   PERFORM VARYING B FROM A BY 1 UNTIL B > FOUND
                       IF B > A AND TERM(A) + TERM(B) = CAND
                           ADD 1 TO WAYS
                       END-IF
                   END-PERFORM
               END-PERFORM
               IF WAYS = 1
                   ADD 1 TO FOUND
                   MOVE CAND TO TERM(FOUND)
               END-IF
           END-PERFORM
           PERFORM VARYING A FROM 1 BY 1 UNTIL A > 15
               MOVE TERM(A) TO ED
               STRING FUNCTION TRIM(ED) " " DELIMITED BY SIZE
                   INTO OUT-LINE WITH POINTER PTR
           END-PERFORM
           DISPLAY FUNCTION TRIM(OUT-LINE)
           STOP RUN.
