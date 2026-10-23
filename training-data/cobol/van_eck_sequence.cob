       IDENTIFICATION DIVISION.
       PROGRAM-ID. VANECKSEQUENCE.
      * Van Eck: next term = distance since last term last appeared, else 0
       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Table slot N holds term a(N-1); slot 1 starts as a(0) = 0
       01 SEQ-TABLE.
           05 SEQ PIC 99 OCCURS 20 TIMES VALUE 0.
       01 N PIC 99.
       01 K PIC S99.
       01 FOUND PIC 9 VALUE 0.
       01 ED PIC Z9.
       01 OUT-LINE PIC X(100) VALUE SPACES.
       01 PTR PIC 999 VALUE 1.

       PROCEDURE DIVISION.
           STRING "0 " DELIMITED BY SIZE
               INTO OUT-LINE WITH POINTER PTR
           PERFORM VARYING N FROM 1 BY 1 UNTIL N > 19
               MOVE 0 TO FOUND
               PERFORM VARYING K FROM N BY -1
                       UNTIL K < 2 OR FOUND = 1
                   IF SEQ(K - 1) = SEQ(N)
                       COMPUTE SEQ(N + 1) = N - K + 1
                       MOVE 1 TO FOUND
                   END-IF
               END-PERFORM
               MOVE SEQ(N + 1) TO ED
               STRING FUNCTION TRIM(ED) " " DELIMITED BY SIZE
                   INTO OUT-LINE WITH POINTER PTR
           END-PERFORM
           DISPLAY FUNCTION TRIM(OUT-LINE)
           STOP RUN.
