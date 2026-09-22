       IDENTIFICATION DIVISION.
       PROGRAM-ID. EDITDISTANCE.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 STR-A PIC X(6) VALUE "KITTEN".
       01 STR-B PIC X(7) VALUE "SITTING".
       01 LEN-A PIC 9(2) VALUE 6.
       01 LEN-B PIC 9(2) VALUE 7.
       01 DP-TABLE.
           05 DP-ROW OCCURS 7 TIMES.
               10 DP-CELL PIC 9(2) OCCURS 8 TIMES.
       01 I PIC 9(2).
       01 J PIC 9(2).
       01 DEL-COST PIC 9(2).
       01 INS-COST PIC 9(2).
       01 SUB-COST PIC 9(2).
       01 MIN-COST PIC 9(2).

       PROCEDURE DIVISION.
           PERFORM VARYING I FROM 0 BY 1 UNTIL I > LEN-A
               MOVE I TO DP-CELL(I + 1, 1)
           END-PERFORM
           PERFORM VARYING J FROM 0 BY 1 UNTIL J > LEN-B
               MOVE J TO DP-CELL(1, J + 1)
           END-PERFORM

           PERFORM VARYING I FROM 1 BY 1 UNTIL I > LEN-A
               PERFORM VARYING J FROM 1 BY 1 UNTIL J > LEN-B
                   IF STR-A(I:1) = STR-B(J:1)
                       MOVE DP-CELL(I, J) TO DP-CELL(I + 1, J + 1)
                   ELSE
                       COMPUTE DEL-COST = DP-CELL(I, J + 1) + 1
                       COMPUTE INS-COST = DP-CELL(I + 1, J) + 1
                       COMPUTE SUB-COST = DP-CELL(I, J) + 1
                       MOVE DEL-COST TO MIN-COST
                       IF INS-COST < MIN-COST
                           MOVE INS-COST TO MIN-COST
                       END-IF
                       IF SUB-COST < MIN-COST
                           MOVE SUB-COST TO MIN-COST
                       END-IF
                       MOVE MIN-COST TO DP-CELL(I + 1, J + 1)
                   END-IF
               END-PERFORM
           END-PERFORM

           DISPLAY "EDIT DISTANCE: " DP-CELL(LEN-A + 1, LEN-B + 1)
           STOP RUN.
