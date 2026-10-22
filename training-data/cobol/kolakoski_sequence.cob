       IDENTIFICATION DIVISION.
       PROGRAM-ID. KOLAKOSKISEQUENCE.
      * Kolakoski over {1,2}: run lengths of the sequence describe itself
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 SEQ-TABLE.
           05 S PIC 9 OCCURS 25 TIMES VALUE 0.
       01 LEN PIC 99 VALUE 3.
       01 I PIC 99 VALUE 3.
       01 J PIC 99.
       01 SYM PIC 9.
       01 OUT-LINE PIC X(100) VALUE SPACES.
       01 PTR PIC 999 VALUE 1.

       PROCEDURE DIVISION.
           MOVE 1 TO S(1)
           MOVE 2 TO S(2)
           MOVE 2 TO S(3)
           PERFORM UNTIL LEN >= 20
               COMPUTE SYM = 3 - S(LEN)
               PERFORM S(I) TIMES
                   ADD 1 TO LEN
                   MOVE SYM TO S(LEN)
               END-PERFORM
               ADD 1 TO I
           END-PERFORM
           PERFORM VARYING J FROM 1 BY 1 UNTIL J > 20
               STRING S(J) " " DELIMITED BY SIZE
                   INTO OUT-LINE WITH POINTER PTR
           END-PERFORM
           DISPLAY FUNCTION TRIM(OUT-LINE)
           STOP RUN.
