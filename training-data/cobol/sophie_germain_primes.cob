       IDENTIFICATION DIVISION.
       PROGRAM-ID. SOPHIE-GERMAIN-PRIMES.
      * Sophie Germain primes: p prime and 2p + 1 prime.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-P      PIC 9(4) VALUE 0.
       01 WS-TEST   PIC 9(4) VALUE 0.
       01 WS-D      PIC 9(4) VALUE 0.
       01 WS-PRIME  PIC 9    VALUE 0.
       01 WS-FIRST  PIC 9    VALUE 0.
       PROCEDURE DIVISION.
       MAIN-PARA.
           PERFORM VARYING WS-P FROM 2 BY 1 UNTIL WS-P > 99
               MOVE WS-P TO WS-TEST
               PERFORM CHECK-PRIME
               MOVE WS-PRIME TO WS-FIRST
               COMPUTE WS-TEST = 2 * WS-P + 1
               PERFORM CHECK-PRIME
               IF WS-FIRST = 1 AND WS-PRIME = 1
                   DISPLAY WS-P " " WITH NO ADVANCING
               END-IF
           END-PERFORM
           DISPLAY " "
           STOP RUN.
       CHECK-PRIME.
           MOVE 1 TO WS-PRIME
           IF WS-TEST < 2
               MOVE 0 TO WS-PRIME
           END-IF
           PERFORM VARYING WS-D FROM 2 BY 1
                   UNTIL WS-D * WS-D > WS-TEST OR WS-PRIME = 0
               IF FUNCTION MOD(WS-TEST, WS-D) = 0
                   MOVE 0 TO WS-PRIME
               END-IF
           END-PERFORM.
