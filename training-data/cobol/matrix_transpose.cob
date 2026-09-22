       IDENTIFICATION DIVISION.
       PROGRAM-ID. MATRIXTRANSPOSE.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 SOURCE-MATRIX.
           05 SRC-ROW OCCURS 2 TIMES.
               10 SRC-COL PIC 9(3) OCCURS 3 TIMES.
       01 DEST-MATRIX.
           05 DEST-ROW OCCURS 3 TIMES.
               10 DEST-COL PIC 9(3) OCCURS 2 TIMES.
       01 I            PIC 9(2) VALUE 1.
       01 J            PIC 9(2) VALUE 1.

       PROCEDURE DIVISION.
           MOVE 1 TO SRC-COL(1, 1)
           MOVE 2 TO SRC-COL(1, 2)
           MOVE 3 TO SRC-COL(1, 3)
           MOVE 4 TO SRC-COL(2, 1)
           MOVE 5 TO SRC-COL(2, 2)
           MOVE 6 TO SRC-COL(2, 3)

           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 2
               PERFORM VARYING J FROM 1 BY 1 UNTIL J > 3
                   MOVE SRC-COL(I, J) TO DEST-COL(J, I)
               END-PERFORM
           END-PERFORM

           PERFORM VARYING J FROM 1 BY 1 UNTIL J > 3
               DISPLAY DEST-COL(J, 1) " " DEST-COL(J, 2)
           END-PERFORM
           STOP RUN.
