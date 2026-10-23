       IDENTIFICATION DIVISION.
       PROGRAM-ID. GOLOMBSEQUENCE.
      * Golomb: G(1) = 1, G(n) = 1 + G(n - G(G(n-1)))
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 G-TABLE.
           05 G PIC 99 OCCURS 20 TIMES VALUE 0.
       01 I PIC 99.
       01 T1 PIC 99.
       01 T2 PIC 99.
       01 T3 PIC 99.
       01 ED PIC Z9.
       01 OUT-LINE PIC X(80) VALUE SPACES.
       01 PTR PIC 99 VALUE 1.

       PROCEDURE DIVISION.
           MOVE 1 TO G(1)
           PERFORM VARYING I FROM 2 BY 1 UNTIL I > 20
               MOVE G(I - 1) TO T1
               MOVE G(T1) TO T2
               COMPUTE T3 = I - T2
               COMPUTE G(I) = 1 + G(T3)
           END-PERFORM
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 20
               MOVE G(I) TO ED
               STRING FUNCTION TRIM(ED) " " DELIMITED BY SIZE
                   INTO OUT-LINE WITH POINTER PTR
           END-PERFORM
           DISPLAY FUNCTION TRIM(OUT-LINE)
           STOP RUN.
