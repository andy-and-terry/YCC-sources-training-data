       IDENTIFICATION DIVISION.
       PROGRAM-ID. EMIRP-PRIMES.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-P     PIC 999.
       01 WS-N     PIC 999.
       01 WS-I     PIC 999.
       01 WS-R     PIC 999.
       01 WS-M     PIC 999.
       01 WS-PRIME PIC 9.
       01 WS-A     PIC 9.
       01 WS-B     PIC 9.
       PROCEDURE DIVISION.
           PERFORM VARYING WS-P FROM 2 BY 1 UNTIL WS-P > 99
               MOVE WS-P TO WS-N
               PERFORM CHECK-PRIME
               MOVE WS-PRIME TO WS-A
               MOVE 0 TO WS-R
               MOVE WS-P TO WS-M
               PERFORM UNTIL WS-M = 0
                   COMPUTE WS-R = WS-R * 10 + FUNCTION MOD(WS-M, 10)
                   COMPUTE WS-M = WS-M / 10
               END-PERFORM
               MOVE WS-R TO WS-N
               PERFORM CHECK-PRIME
               MOVE WS-PRIME TO WS-B
               IF WS-A = 1 AND WS-B = 1 AND WS-R NOT = WS-P
                   DISPLAY WS-P
               END-IF
           END-PERFORM
           STOP RUN.
       CHECK-PRIME.
           MOVE 1 TO WS-PRIME
           IF WS-N < 2 MOVE 0 TO WS-PRIME END-IF
           PERFORM VARYING WS-I FROM 2 BY 1
                   UNTIL WS-I * WS-I > WS-N OR WS-PRIME = 0
               IF FUNCTION MOD(WS-N, WS-I) = 0 MOVE 0 TO WS-PRIME END-IF
           END-PERFORM.
