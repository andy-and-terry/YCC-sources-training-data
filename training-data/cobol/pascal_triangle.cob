       IDENTIFICATION DIVISION.
       PROGRAM-ID. PASCAL-TRIANGLE.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 ROW-TABLE.
          05 CELL      PIC 9(5) OCCURS 10 TIMES VALUE 0.
       01 I           PIC 9(2) VALUE 0.
       01 J           PIC 9(2) VALUE 0.
       01 OUT-NUM     PIC ZZZZ9.
       01 LINE-OUT    PIC X(60) VALUE SPACES.
       01 PTR         PIC 9(3) VALUE 1.

       PROCEDURE DIVISION.
           MOVE 1 TO CELL(1)
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 6
               PERFORM VARYING J FROM I BY -1 UNTIL J < 2
                   ADD CELL(J - 1) TO CELL(J)
               END-PERFORM
               MOVE SPACES TO LINE-OUT
               MOVE 1 TO PTR
               PERFORM VARYING J FROM 1 BY 1 UNTIL J > I
                   MOVE CELL(J) TO OUT-NUM
                   STRING OUT-NUM DELIMITED BY SIZE
                       INTO LINE-OUT WITH POINTER PTR
               END-PERFORM
               DISPLAY LINE-OUT
           END-PERFORM
           STOP RUN.
