       IDENTIFICATION DIVISION.
       PROGRAM-ID. LCSLENGTH.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 STR-A PIC X(7) VALUE "ABCBDAB".
       01 STR-B PIC X(6) VALUE "BDCABA".
       01 DP-TABLE.
           05 DP-ROW OCCURS 8 TIMES.
               10 DP-COL PIC 9(2) OCCURS 7 TIMES.
       01 I PIC 9(2).
       01 J PIC 9(2).
       01 CHAR-A PIC X.
       01 CHAR-B PIC X.

       PROCEDURE DIVISION.
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 8
               MOVE 0 TO DP-COL(I, 1)
           END-PERFORM
           PERFORM VARYING J FROM 1 BY 1 UNTIL J > 7
               MOVE 0 TO DP-COL(1, J)
           END-PERFORM

           PERFORM VARYING I FROM 2 BY 1 UNTIL I > 8
               PERFORM VARYING J FROM 2 BY 1 UNTIL J > 7
                   MOVE STR-A(I - 1:1) TO CHAR-A
                   MOVE STR-B(J - 1:1) TO CHAR-B
                   IF CHAR-A = CHAR-B
                       COMPUTE DP-COL(I, J) = DP-COL(I - 1, J - 1) + 1
                   ELSE
                       IF DP-COL(I - 1, J) > DP-COL(I, J - 1)
                           MOVE DP-COL(I - 1, J) TO DP-COL(I, J)
                       ELSE
                           MOVE DP-COL(I, J - 1) TO DP-COL(I, J)
                       END-IF
                   END-IF
               END-PERFORM
           END-PERFORM

           DISPLAY "LCS LENGTH: " DP-COL(8, 7)
           STOP RUN.
