       IDENTIFICATION DIVISION.
       PROGRAM-ID. HOFSTADTERQ.
      * Hofstadter Q: Q(n) = Q(n - Q(n-1)) + Q(n - Q(n-2))
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 Q-TABLE.
           05 Q PIC 99 OCCURS 20 TIMES VALUE 0.
       01 I PIC 99.
       01 T1 PIC 99.
       01 T2 PIC 99.
       01 ED PIC Z9.
       01 OUT-LINE PIC X(80) VALUE SPACES.
       01 PTR PIC 99 VALUE 1.

       PROCEDURE DIVISION.
           MOVE 1 TO Q(1)
           MOVE 1 TO Q(2)
           PERFORM VARYING I FROM 3 BY 1 UNTIL I > 20
               COMPUTE T1 = I - Q(I - 1)
               COMPUTE T2 = I - Q(I - 2)
               COMPUTE Q(I) = Q(T1) + Q(T2)
           END-PERFORM
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 20
               MOVE Q(I) TO ED
               STRING FUNCTION TRIM(ED) " " DELIMITED BY SIZE
                   INTO OUT-LINE WITH POINTER PTR
           END-PERFORM
           DISPLAY FUNCTION TRIM(OUT-LINE)
           STOP RUN.
