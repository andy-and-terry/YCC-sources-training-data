       IDENTIFICATION DIVISION.
       PROGRAM-ID. STERNDIATOMICSEQUENCE.
      * Stern: s(0)=0, s(1)=1, s(2n)=s(n), s(2n+1)=s(n)+s(n+1)
       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Table slot N + 1 holds s(N)
       01 S-TABLE.
           05 S PIC 99 OCCURS 20 TIMES VALUE 0.
       01 N PIC 99.
       01 H PIC 99.
       01 R PIC 9.
       01 ED PIC Z9.
       01 OUT-LINE PIC X(100) VALUE SPACES.
       01 PTR PIC 999 VALUE 1.

       PROCEDURE DIVISION.
           MOVE 1 TO S(2)
           PERFORM VARYING N FROM 2 BY 1 UNTIL N > 19
               DIVIDE N BY 2 GIVING H REMAINDER R
               IF R = 0
                   MOVE S(H + 1) TO S(N + 1)
               ELSE
                   COMPUTE S(N + 1) = S(H + 1) + S(H + 2)
               END-IF
           END-PERFORM
           PERFORM VARYING N FROM 1 BY 1 UNTIL N > 20
               MOVE S(N) TO ED
               STRING FUNCTION TRIM(ED) " " DELIMITED BY SIZE
                   INTO OUT-LINE WITH POINTER PTR
           END-PERFORM
           DISPLAY FUNCTION TRIM(OUT-LINE)
           STOP RUN.
