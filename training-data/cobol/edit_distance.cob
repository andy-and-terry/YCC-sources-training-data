       IDENTIFICATION DIVISION.
       PROGRAM-ID. EDITDISTANCE.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 STR-A PIC X(6) VALUE "SUNDAY".
       01 STR-B PIC X(8) VALUE "SATURDAY".
       01 LEN-A PIC 9(2) VALUE 6.
       01 LEN-B PIC 9(2) VALUE 8.
       01 DP-TABLE.
           05 DP-ROW OCCURS 7 TIMES.
               10 DP-CELL PIC 9(2) OCCURS 9 TIMES VALUE 0.
       01 I PIC 9(2).
       01 J PIC 9(2).
       01 DELETE-COST PIC 9(2).
       01 INSERT-COST PIC 9(2).
       01 REPLACE-COST PIC 9(2).
       01 BEST-COST PIC 9(2).

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
                       MOVE DP-CELL(I, J + 1) TO DELETE-COST
                       MOVE DP-CELL(I + 1, J) TO INSERT-COST
                       MOVE DP-CELL(I, J) TO REPLACE-COST
                       MOVE DELETE-COST TO BEST-COST
                       IF INSERT-COST < BEST-COST
                           MOVE INSERT-COST TO BEST-COST
                       END-IF
                       IF REPLACE-COST < BEST-COST
                           MOVE REPLACE-COST TO BEST-COST
                       END-IF
                       COMPUTE DP-CELL(I + 1, J + 1) = BEST-COST + 1
                   END-IF
               END-PERFORM
           END-PERFORM

           DISPLAY "EDIT DISTANCE: " DP-CELL(LEN-A + 1, LEN-B + 1)
           STOP RUN.
