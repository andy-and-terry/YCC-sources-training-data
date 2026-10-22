       IDENTIFICATION DIVISION.
       PROGRAM-ID. LUCKYNUMBERS.
      * Start with odds, then delete every k-th survivor for each k
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 LUCKY-TABLE.
           05 L PIC 99 OCCURS 60 TIMES VALUE 0.
       01 V PIC 99.
       01 N PIC 99 VALUE 0.
       01 M PIC 99.
       01 I PIC 99 VALUE 2.
       01 J PIC 99.
       01 STEP-K PIC 99.
       01 ED PIC Z9.
       01 OUT-LINE PIC X(100) VALUE SPACES.
       01 PTR PIC 999 VALUE 1.

       PROCEDURE DIVISION.
           PERFORM VARYING V FROM 1 BY 2 UNTIL V > 50
               ADD 1 TO N
               MOVE V TO L(N)
           END-PERFORM
           PERFORM UNTIL I > N OR L(I) > N
               MOVE L(I) TO STEP-K
               MOVE 0 TO M
               PERFORM VARYING J FROM 1 BY 1 UNTIL J > N
                   IF FUNCTION MOD(J, STEP-K) NOT = 0
                       ADD 1 TO M
                       MOVE L(J) TO L(M)
                   END-IF
               END-PERFORM
               MOVE M TO N
               ADD 1 TO I
           END-PERFORM
           PERFORM VARYING J FROM 1 BY 1 UNTIL J > N
               MOVE L(J) TO ED
               STRING FUNCTION TRIM(ED) " " DELIMITED BY SIZE
                   INTO OUT-LINE WITH POINTER PTR
           END-PERFORM
           DISPLAY FUNCTION TRIM(OUT-LINE)
           STOP RUN.
