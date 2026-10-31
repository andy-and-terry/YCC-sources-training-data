       IDENTIFICATION DIVISION.
       PROGRAM-ID. SPHENIC.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 N        PIC 9(3).
       01 M        PIC 9(3).
       01 P        PIC 9(3).
       01 DISTINCT PIC 9(2).
       01 OK       PIC X.
       PROCEDURE DIVISION.
           PERFORM VARYING N FROM 2 BY 1 UNTIL N > 79
               MOVE N TO M
               MOVE 0 TO DISTINCT
               MOVE "Y" TO OK
               MOVE 2 TO P
               PERFORM UNTIL P * P > M OR OK = "N"
                   IF FUNCTION MOD(M, P) = 0
                       COMPUTE M = M / P
                       IF FUNCTION MOD(M, P) = 0
                           MOVE "N" TO OK
                       ELSE
                           ADD 1 TO DISTINCT
                       END-IF
                   END-IF
                   ADD 1 TO P
               END-PERFORM
               IF M > 1
                   ADD 1 TO DISTINCT
               END-IF
               IF OK = "Y" AND DISTINCT = 3
                   DISPLAY N
               END-IF
           END-PERFORM
           STOP RUN.
