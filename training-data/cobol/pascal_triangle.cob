       IDENTIFICATION DIVISION.
       PROGRAM-ID. PASCALTRIANGLE.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 TRIANGLE.
          05 TROW OCCURS 6 TIMES.
             10 TCELL PIC 9(4) OCCURS 6 TIMES.
       01 I           PIC 9(2).
       01 J           PIC 9(2).
       01 PREV-I      PIC 9(2).
       01 PREV-J      PIC 9(2).
       01 LINE-OUT    PIC X(40).
       01 PTR         PIC 9(2).
       01 CELL-ED     PIC ZZZ9.

       PROCEDURE DIVISION.
           INITIALIZE TRIANGLE
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 6
               MOVE 1 TO TCELL(I, 1)
               PERFORM VARYING J FROM 2 BY 1 UNTIL J > I
                   COMPUTE PREV-I = I - 1
                   COMPUTE PREV-J = J - 1
                   COMPUTE TCELL(I, J) =
                       TCELL(PREV-I, PREV-J) + TCELL(PREV-I, J)
               END-PERFORM
           END-PERFORM
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 6
               MOVE SPACES TO LINE-OUT
               MOVE 1 TO PTR
               PERFORM VARYING J FROM 1 BY 1 UNTIL J > I
                   MOVE TCELL(I, J) TO CELL-ED
                   STRING CELL-ED DELIMITED BY SIZE
                       INTO LINE-OUT WITH POINTER PTR
               END-PERFORM
               DISPLAY LINE-OUT
           END-PERFORM
           STOP RUN.
