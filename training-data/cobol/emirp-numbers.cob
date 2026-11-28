       IDENTIFICATION DIVISION.
       PROGRAM-ID. EMIRP.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 P         PIC 9(3).
       01 REV       PIC 9(3).
       01 M         PIC 9(3).
       01 CHK       PIC 9(3).
       01 DIV       PIC 9(3).
       01 PRIME-FLAG PIC 9.

       PROCEDURE DIVISION.
           PERFORM VARYING P FROM 11 BY 1 UNTIL P > 199
               MOVE P TO CHK
               PERFORM CHECK-PRIME
               IF PRIME-FLAG = 1
                   MOVE P TO M
                   MOVE 0 TO REV
                   PERFORM UNTIL M = 0
                       COMPUTE REV = REV * 10 + FUNCTION MOD(M, 10)
                       COMPUTE M = M / 10
                   END-PERFORM
                   MOVE REV TO CHK
                   IF REV NOT = P
                       PERFORM CHECK-PRIME
                       IF PRIME-FLAG = 1
                           DISPLAY P
                       END-IF
                   END-IF
               END-IF
           END-PERFORM
           STOP RUN.

       CHECK-PRIME.
           MOVE 1 TO PRIME-FLAG
           IF CHK < 2 MOVE 0 TO PRIME-FLAG
           ELSE
               PERFORM VARYING DIV FROM 2 BY 1
                       UNTIL DIV * DIV > CHK OR PRIME-FLAG = 0
                   IF FUNCTION MOD(CHK, DIV) = 0
                       MOVE 0 TO PRIME-FLAG
                   END-IF
               END-PERFORM
           END-IF.
