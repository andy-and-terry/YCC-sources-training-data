       IDENTIFICATION DIVISION.
       PROGRAM-ID. DELANNOYNUMBERS.
      * Central Delannoy: D(m,n) = D(m-1,n) + D(m,n-1) + D(m-1,n-1)
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 D-TABLE.
           05 D-ROW OCCURS 10 TIMES.
               10 D PIC 9(8) OCCURS 10 TIMES VALUE 0.
       01 M PIC 99.
       01 N PIC 99.
       01 ED PIC Z(7)9.
       01 OUT-LINE PIC X(100) VALUE SPACES.
       01 PTR PIC 999 VALUE 1.

       PROCEDURE DIVISION.
           PERFORM VARYING M FROM 1 BY 1 UNTIL M > 10
               PERFORM VARYING N FROM 1 BY 1 UNTIL N > 10
                   IF M = 1 OR N = 1
                       MOVE 1 TO D(M, N)
                   ELSE
                       COMPUTE D(M, N) = D(M - 1, N) + D(M, N - 1)
                           + D(M - 1, N - 1)
                   END-IF
               END-PERFORM
           END-PERFORM
           PERFORM VARYING M FROM 1 BY 1 UNTIL M > 10
               MOVE D(M, M) TO ED
               STRING FUNCTION TRIM(ED) " " DELIMITED BY SIZE
                   INTO OUT-LINE WITH POINTER PTR
           END-PERFORM
           DISPLAY FUNCTION TRIM(OUT-LINE)
           STOP RUN.
