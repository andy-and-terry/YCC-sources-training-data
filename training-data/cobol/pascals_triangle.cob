       IDENTIFICATION DIVISION.
       PROGRAM-ID. PASCALSTRIANGLE.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 TRIANGLE.
           05 TRI-ROW OCCURS 6 TIMES.
               10 TRI-CELL PIC 9(3) OCCURS 6 TIMES.
       01 R PIC 9(1).
       01 C PIC 9(1).
       01 LINE-OUT PIC X(40).

       PROCEDURE DIVISION.
           PERFORM VARYING R FROM 1 BY 1 UNTIL R > 6
               MOVE 1 TO TRI-CELL(R, 1)
               MOVE 1 TO TRI-CELL(R, R)
               IF R > 2
                   PERFORM VARYING C FROM 2 BY 1 UNTIL C >= R
                       COMPUTE TRI-CELL(R, C) =
                           TRI-CELL(R - 1, C - 1) + TRI-CELL(R - 1, C)
                   END-PERFORM
               END-IF
           END-PERFORM

           PERFORM VARYING R FROM 1 BY 1 UNTIL R > 6
               MOVE SPACES TO LINE-OUT
               PERFORM VARYING C FROM 1 BY 1 UNTIL C > R
                   STRING FUNCTION TRIM(LINE-OUT) DELIMITED BY SIZE
                          " " TRI-CELL(R, C) DELIMITED BY SIZE
                       INTO LINE-OUT
                   END-STRING
               END-PERFORM
               DISPLAY FUNCTION TRIM(LINE-OUT)
           END-PERFORM
           STOP RUN.
