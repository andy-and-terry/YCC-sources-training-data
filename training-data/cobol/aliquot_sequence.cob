       IDENTIFICATION DIVISION.
       PROGRAM-ID. ALIQUOTSEQUENCE.
      * Replace n by the sum of its proper divisors until 0
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 N PIC 9(5) VALUE 12.
       01 TOTAL PIC 9(5).
       01 HALF PIC 9(5).
       01 D PIC 9(5).
       01 ED PIC Z(4)9.
       01 OUT-LINE PIC X(100) VALUE SPACES.
       01 PTR PIC 999 VALUE 1.

       PROCEDURE DIVISION.
           PERFORM APPEND-TERM
           PERFORM UNTIL N = 0
               MOVE 0 TO TOTAL
               COMPUTE HALF = N / 2
               PERFORM VARYING D FROM 1 BY 1 UNTIL D > HALF
                   IF FUNCTION MOD(N, D) = 0
                       ADD D TO TOTAL
                   END-IF
               END-PERFORM
               MOVE TOTAL TO N
               PERFORM APPEND-TERM
           END-PERFORM
           DISPLAY FUNCTION TRIM(OUT-LINE)
           STOP RUN.

       APPEND-TERM.
           MOVE N TO ED
           STRING FUNCTION TRIM(ED) " " DELIMITED BY SIZE
               INTO OUT-LINE WITH POINTER PTR.
