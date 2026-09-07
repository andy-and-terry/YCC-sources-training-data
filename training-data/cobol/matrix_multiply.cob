       IDENTIFICATION DIVISION.
       PROGRAM-ID. MATRIXMULTIPLY.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 A.
           05 A-ROW OCCURS 2 TIMES.
               10 A-COL PIC 9(2) OCCURS 3 TIMES.
       01 B.
           05 B-ROW OCCURS 3 TIMES.
               10 B-COL PIC 9(2) OCCURS 2 TIMES.
       01 RESULT-MATRIX.
           05 RESULT-ROW OCCURS 2 TIMES.
               10 RESULT-COL PIC 9(4) OCCURS 2 TIMES.
       01 I PIC 9(2).
       01 J PIC 9(2).
       01 K PIC 9(2).
       01 SUM PIC 9(4).

       PROCEDURE DIVISION.
           MOVE 1 TO A-COL(1, 1)
           MOVE 2 TO A-COL(1, 2)
           MOVE 3 TO A-COL(1, 3)
           MOVE 4 TO A-COL(2, 1)
           MOVE 5 TO A-COL(2, 2)
           MOVE 6 TO A-COL(2, 3)
           MOVE 7 TO B-COL(1, 1)
           MOVE 8 TO B-COL(1, 2)
           MOVE 9 TO B-COL(2, 1)
           MOVE 10 TO B-COL(2, 2)
           MOVE 11 TO B-COL(3, 1)
           MOVE 12 TO B-COL(3, 2)
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 2
               PERFORM VARYING J FROM 1 BY 1 UNTIL J > 2
                   MOVE 0 TO SUM
                   PERFORM VARYING K FROM 1 BY 1 UNTIL K > 3
                       COMPUTE SUM = SUM + A-COL(I, K) * B-COL(K, J)
                   END-PERFORM
                   MOVE SUM TO RESULT-COL(I, J)
               END-PERFORM
           END-PERFORM
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 2
               DISPLAY RESULT-COL(I, 1) " " RESULT-COL(I, 2)
           END-PERFORM
           STOP RUN.
