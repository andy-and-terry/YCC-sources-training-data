       IDENTIFICATION DIVISION.
       PROGRAM-ID. FAREYSEQUENCE.
      * Farey sequence F-n: reduced fractions in [0,1], denominator <= n
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 N PIC 9 VALUE 5.
       01 A PIC 9 VALUE 0.
       01 B PIC 9 VALUE 1.
       01 C PIC 9 VALUE 1.
       01 D PIC 9 VALUE 5.
       01 E PIC 9.
       01 F PIC 9.
       01 K PIC 99.
       01 OUT-LINE PIC X(80) VALUE SPACES.
       01 PTR PIC 99 VALUE 1.

       PROCEDURE DIVISION.
           STRING A "/" B " " DELIMITED BY SIZE
               INTO OUT-LINE WITH POINTER PTR
           PERFORM UNTIL C > N
               COMPUTE K = (N + B) / D
               COMPUTE E = K * C - A
               COMPUTE F = K * D - B
               MOVE C TO A
               MOVE D TO B
               MOVE E TO C
               MOVE F TO D
               STRING A "/" B " " DELIMITED BY SIZE
                   INTO OUT-LINE WITH POINTER PTR
           END-PERFORM
           DISPLAY FUNCTION TRIM(OUT-LINE)
           STOP RUN.
