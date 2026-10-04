       IDENTIFICATION DIVISION.
       PROGRAM-ID. PASCALTRIANGLE.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 ROWS        PIC 9(2) VALUE 6.
       01 TRI.
           05 TRI-ROW OCCURS 10 TIMES.
               10 TRI-CELL PIC 9(5) OCCURS 10 TIMES.
       01 R           PIC 9(2).
       01 C           PIC 9(2).
       01 PREV-R      PIC 9(2).
       01 PREV-C      PIC 9(2).
       01 LINE-OUT    PIC X(60).
       01 CELL-EDIT   PIC ZZZZ9.
       01 PTR         PIC 9(3).

       PROCEDURE DIVISION.
           PERFORM VARYING R FROM 1 BY 1 UNTIL R > ROWS
               MOVE 1 TO TRI-CELL(R, 1)
               MOVE 1 TO TRI-CELL(R, R)
               PERFORM VARYING C FROM 2 BY 1 UNTIL C >= R
                   COMPUTE PREV-R = R - 1
                   COMPUTE PREV-C = C - 1
                   COMPUTE TRI-CELL(R, C) =
                       TRI-CELL(PREV-R, PREV-C) + TRI-CELL(PREV-R, C)
               END-PERFORM
           END-PERFORM
           PERFORM VARYING R FROM 1 BY 1 UNTIL R > ROWS
               MOVE SPACES TO LINE-OUT
               MOVE 1 TO PTR
               PERFORM VARYING C FROM 1 BY 1 UNTIL C > R
                   MOVE TRI-CELL(R, C) TO CELL-EDIT
                   STRING CELL-EDIT DELIMITED BY SIZE
                       INTO LINE-OUT WITH POINTER PTR
                   END-STRING
               END-PERFORM
               DISPLAY LINE-OUT
           END-PERFORM
           STOP RUN.
