       IDENTIFICATION DIVISION.
       PROGRAM-ID. POWERFUL.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 N        PIC 9(3).
       01 M        PIC 9(3).
       01 P        PIC 9(3).
       01 PP       PIC 9(5).
       01 OK       PIC X.
       PROCEDURE DIVISION.
           PERFORM VARYING N FROM 1 BY 1 UNTIL N > 100
               MOVE N TO M
               MOVE "Y" TO OK
               MOVE 2 TO P
               PERFORM UNTIL P * P > M OR OK = "N"
                   IF FUNCTION MOD(M, P) = 0
                       COMPUTE PP = P * P
                       IF FUNCTION MOD(M, PP) NOT = 0
                           MOVE "N" TO OK
                       ELSE
                           PERFORM UNTIL FUNCTION MOD(M, P) NOT = 0
                               COMPUTE M = M / P
                           END-PERFORM
                       END-IF
                   END-IF
                   ADD 1 TO P
               END-PERFORM
               IF OK = "Y" AND M = 1
                   DISPLAY N
               END-IF
           END-PERFORM
           STOP RUN.
