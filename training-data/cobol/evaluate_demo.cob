       IDENTIFICATION DIVISION.
       PROGRAM-ID. EVALUATEDEMO.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 SCORE PIC 9(3).
       01 GRADE PIC X(1).
       01 I PIC 9(2).

       PROCEDURE DIVISION.
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 5
               EVALUATE I
                   WHEN 1
                       MOVE 95 TO SCORE
                   WHEN 2
                       MOVE 82 TO SCORE
                   WHEN 3
                       MOVE 71 TO SCORE
                   WHEN 4
                       MOVE 55 TO SCORE
                   WHEN OTHER
                       MOVE 40 TO SCORE
               END-EVALUATE
               EVALUATE TRUE
                   WHEN SCORE >= 90
                       MOVE "A" TO GRADE
                   WHEN SCORE >= 80
                       MOVE "B" TO GRADE
                   WHEN SCORE >= 70
                       MOVE "C" TO GRADE
                   WHEN SCORE >= 60
                       MOVE "D" TO GRADE
                   WHEN OTHER
                       MOVE "F" TO GRADE
               END-EVALUATE
               DISPLAY "SCORE: " SCORE " GRADE: " GRADE
           END-PERFORM
           STOP RUN.
