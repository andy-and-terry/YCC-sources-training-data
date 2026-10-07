       IDENTIFICATION DIVISION.
       PROGRAM-ID. SORTEMPLOYEETABLE.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 EMP-TABLE.
           05 EMP-ENTRY OCCURS 5 TIMES.
               10 EMP-NAME PIC X(10).
               10 EMP-SCORE PIC 9(3).
       01 I PIC 9(2).
       01 J PIC 9(2).
       01 TEMP-NAME PIC X(10).
       01 TEMP-SCORE PIC 9(3).

       PROCEDURE DIVISION.
           MOVE "DAN" TO EMP-NAME(1)
           MOVE 72 TO EMP-SCORE(1)
           MOVE "ERIN" TO EMP-NAME(2)
           MOVE 95 TO EMP-SCORE(2)
           MOVE "FRANK" TO EMP-NAME(3)
           MOVE 60 TO EMP-SCORE(3)
           MOVE "GINA" TO EMP-NAME(4)
           MOVE 88 TO EMP-SCORE(4)
           MOVE "HANK" TO EMP-NAME(5)
           MOVE 79 TO EMP-SCORE(5)

           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 4
               PERFORM VARYING J FROM 1 BY 1 UNTIL J > 5 - I
                   IF EMP-SCORE(J) < EMP-SCORE(J + 1)
                       MOVE EMP-NAME(J) TO TEMP-NAME
                       MOVE EMP-SCORE(J) TO TEMP-SCORE
                       MOVE EMP-NAME(J + 1) TO EMP-NAME(J)
                       MOVE EMP-SCORE(J + 1) TO EMP-SCORE(J)
                       MOVE TEMP-NAME TO EMP-NAME(J + 1)
                       MOVE TEMP-SCORE TO EMP-SCORE(J + 1)
                   END-IF
               END-PERFORM
           END-PERFORM

           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 5
               DISPLAY EMP-NAME(I) " " EMP-SCORE(I)
           END-PERFORM
           STOP RUN.
