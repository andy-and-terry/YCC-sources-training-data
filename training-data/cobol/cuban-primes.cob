       IDENTIFICATION DIVISION.
       PROGRAM-ID. CUBAN-PRIMES.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-Y     PIC 9(4) VALUE 1.
       01 WS-P     PIC 9(8).
       01 WS-I     PIC 9(5).
       01 WS-PRIME PIC 9.
       01 WS-FOUND PIC 9 VALUE 0.
       PROCEDURE DIVISION.
           PERFORM UNTIL WS-FOUND = 8
               COMPUTE WS-P = 3 * WS-Y * WS-Y + 3 * WS-Y + 1
               MOVE 1 TO WS-PRIME
               PERFORM VARYING WS-I FROM 2 BY 1
                       UNTIL WS-I * WS-I > WS-P OR WS-PRIME = 0
                   IF FUNCTION MOD(WS-P, WS-I) = 0 MOVE 0 TO WS-PRIME END-IF
               END-PERFORM
               IF WS-PRIME = 1
                   DISPLAY WS-P
                   ADD 1 TO WS-FOUND
               END-IF
               ADD 1 TO WS-Y
           END-PERFORM
           STOP RUN.
