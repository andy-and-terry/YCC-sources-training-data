       IDENTIFICATION DIVISION.
       PROGRAM-ID. KOLAKOSKISEQUENCE.
      * Kolakoski: a sequence of 1s and 2s that describes its own runs
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 SEQ-TABLE.
           05 SEQ PIC 9 OCCURS 30 TIMES VALUE 0.
       01 LEN PIC 99 VALUE 3.
       01 I PIC 99 VALUE 3.
       01 J PIC 99.
       01 K PIC 99.
       01 SYMBOL-VAL PIC 9.
       01 OUT-LINE PIC X(100) VALUE SPACES.
       01 PTR PIC 999 VALUE 1.

       PROCEDURE DIVISION.
           MOVE 1 TO SEQ(1)
           MOVE 2 TO SEQ(2)
           MOVE 2 TO SEQ(3)
           PERFORM UNTIL LEN >= 20
               IF FUNCTION MOD(I, 2) = 1
                   MOVE 1 TO SYMBOL-VAL
               ELSE
                   MOVE 2 TO SYMBOL-VAL
               END-IF
               PERFORM VARYING J FROM 1 BY 1 UNTIL J > SEQ(I)
                   ADD 1 TO LEN
                   MOVE SYMBOL-VAL TO SEQ(LEN)
               END-PERFORM
               ADD 1 TO I
           END-PERFORM
           PERFORM VARYING K FROM 1 BY 1 UNTIL K > 20
               STRING SEQ(K) " " DELIMITED BY SIZE
                   INTO OUT-LINE WITH POINTER PTR
           END-PERFORM
           DISPLAY FUNCTION TRIM(OUT-LINE)
           STOP RUN.
