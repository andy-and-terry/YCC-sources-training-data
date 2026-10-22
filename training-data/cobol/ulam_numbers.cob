       IDENTIFICATION DIVISION.
       PROGRAM-ID. ULAMNUMBERS.
      * Next term: smallest value with exactly one sum of two distinct terms
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 U-TABLE.
           05 U PIC 999 OCCURS 15 TIMES VALUE 0.
       01 N PIC 99 VALUE 2.
       01 CAND PIC 999 VALUE 2.
       01 WAYS PIC 99.
       01 A PIC 99.
       01 B PIC 99.
       01 ED PIC Z(2)9.
       01 OUT-LINE PIC X(100) VALUE SPACES.
       01 PTR PIC 999 VALUE 1.

       PROCEDURE DIVISION.
           MOVE 1 TO U(1)
           MOVE 2 TO U(2)
           PERFORM UNTIL N >= 15
               ADD 1 TO CAND
               MOVE 0 TO WAYS
               PERFORM VARYING A FROM 1 BY 1 UNTIL A > N
                   PERFORM VARYING B FROM 1 BY 1 UNTIL B > N
                       IF B > A AND U(A) + U(B) = CAND
                           ADD 1 TO WAYS
                       END-IF
                   END-PERFORM
               END-PERFORM
               IF WAYS = 1
                   ADD 1 TO N
                   MOVE CAND TO U(N)
               END-IF
           END-PERFORM
           PERFORM VARYING A FROM 1 BY 1 UNTIL A > 15
               MOVE U(A) TO ED
               STRING FUNCTION TRIM(ED) " " DELIMITED BY SIZE
                   INTO OUT-LINE WITH POINTER PTR
           END-PERFORM
           DISPLAY FUNCTION TRIM(OUT-LINE)
           STOP RUN.
