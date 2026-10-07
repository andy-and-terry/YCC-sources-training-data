       IDENTIFICATION DIVISION.
       PROGRAM-ID. LCSDEMO.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 STR-A PIC X(6) VALUE "ABCBDB".
       01 STR-B PIC X(6) VALUE "BDCABA".
       01 LEN-A PIC 9(2) VALUE 6.
       01 LEN-B PIC 9(2) VALUE 6.
       01 DP-TABLE.
           05 DP-ROW OCCURS 7 TIMES.
               10 DP-CELL PIC 9(2) OCCURS 7 TIMES.
       01 I PIC 9(2).
       01 J PIC 9(2).

       PROCEDURE DIVISION.
           PERFORM VARYING I FROM 0 BY 1 UNTIL I > LEN-A
               MOVE 0 TO DP-CELL(I + 1, 1)
           END-PERFORM
           PERFORM VARYING J FROM 0 BY 1 UNTIL J > LEN-B
               MOVE 0 TO DP-CELL(1, J + 1)
           END-PERFORM

           PERFORM VARYING I FROM 1 BY 1 UNTIL I > LEN-A
               PERFORM VARYING J FROM 1 BY 1 UNTIL J > LEN-B
                   IF STR-A(I:1) = STR-B(J:1)
                       COMPUTE DP-CELL(I + 1, J + 1) =
                           DP-CELL(I, J) + 1
                   ELSE
                       IF DP-CELL(I, J + 1) > DP-CELL(I + 1, J)
                           MOVE DP-CELL(I, J + 1)
                               TO DP-CELL(I + 1, J + 1)
                       ELSE
                           MOVE DP-CELL(I + 1, J)
                               TO DP-CELL(I + 1, J + 1)
                       END-IF
                   END-IF
               END-PERFORM
           END-PERFORM

           DISPLAY "LCS LENGTH: " DP-CELL(LEN-A + 1, LEN-B + 1)
           STOP RUN.
