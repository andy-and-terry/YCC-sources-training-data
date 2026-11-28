       IDENTIFICATION DIVISION.
       PROGRAM-ID. PALPRIME.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 N         PIC 9(3).
       01 M         PIC 9(3).
       01 REV       PIC 9(3).
       01 DIV       PIC 9(3).
       01 PRIME-FLAG PIC 9.

       PROCEDURE DIVISION.
           PERFORM VARYING N FROM 2 BY 1 UNTIL N > 199
               MOVE N TO M
               MOVE 0 TO REV
               PERFORM UNTIL M = 0
                   COMPUTE REV = REV * 10 + FUNCTION MOD(M, 10)
                   COMPUTE M = M / 10
               END-PERFORM
               IF REV = N
                   MOVE 1 TO PRIME-FLAG
                   PERFORM VARYING DIV FROM 2 BY 1
                           UNTIL DIV * DIV > N OR PRIME-FLAG = 0
                       IF FUNCTION MOD(N, DIV) = 0
                           MOVE 0 TO PRIME-FLAG
                       END-IF
                   END-PERFORM
                   IF PRIME-FLAG = 1
                       DISPLAY N
                   END-IF
               END-IF
           END-PERFORM
           STOP RUN.
