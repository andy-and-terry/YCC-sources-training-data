       IDENTIFICATION DIVISION.
       PROGRAM-ID. EMIRPS.
      * Emirps: primes whose digit reversal is a different prime.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 N        PIC 9(3).
       01 R        PIC 9(3).
       01 T        PIC 9(3).
       01 X        PIC 9(3).
       01 I        PIC 9(3).
       01 PRIME-FLAG PIC 9.
       01 N-PRIME  PIC 9.
       PROCEDURE DIVISION.
           PERFORM VARYING N FROM 2 BY 1 UNTIL N > 99
               MOVE 0 TO R
               MOVE N TO T
               PERFORM UNTIL T = 0
                   COMPUTE R = R * 10 + FUNCTION MOD(T, 10)
                   COMPUTE T = T / 10
               END-PERFORM
               IF R NOT = N
                   MOVE N TO X
                   PERFORM CHECK-PRIME
                   MOVE PRIME-FLAG TO N-PRIME
                   MOVE R TO X
                   PERFORM CHECK-PRIME
                   IF N-PRIME = 1 AND PRIME-FLAG = 1
                       DISPLAY N
                   END-IF
               END-IF
           END-PERFORM
           STOP RUN.

       CHECK-PRIME.
           MOVE 1 TO PRIME-FLAG
           IF X < 2
               MOVE 0 TO PRIME-FLAG
           END-IF
           PERFORM VARYING I FROM 2 BY 1 UNTIL I * I > X
               IF FUNCTION MOD(X, I) = 0
                   MOVE 0 TO PRIME-FLAG
               END-IF
           END-PERFORM.
