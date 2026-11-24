       IDENTIFICATION DIVISION.
       PROGRAM-ID. MOBIUS-FUNCTION.
      * Moebius function: 0 if n has a squared prime factor, else
      * (-1)^k for k distinct primes.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-I       PIC 99 VALUE 0.
       01 WS-M       PIC 99 VALUE 0.
       01 WS-P       PIC 99 VALUE 0.
       01 WS-RES     PIC S9 VALUE 0.
       01 WS-REM     PIC 99 VALUE 0.
       01 WS-DONE    PIC 9 VALUE 0.
       01 WS-OUT     PIC -9.
       PROCEDURE DIVISION.
           PERFORM VARYING WS-I FROM 1 BY 1 UNTIL WS-I > 30
               PERFORM COMPUTE-MOBIUS
               MOVE WS-RES TO WS-OUT
               DISPLAY WS-OUT " " WITH NO ADVANCING
           END-PERFORM
           DISPLAY " "
           STOP RUN.
       COMPUTE-MOBIUS.
           MOVE WS-I TO WS-M
           MOVE 2 TO WS-P
           MOVE 1 TO WS-RES
           MOVE 0 TO WS-DONE
           PERFORM UNTIL WS-DONE = 1 OR WS-P * WS-P > WS-M
               COMPUTE WS-REM = FUNCTION MOD (WS-M, WS-P)
               IF WS-REM = 0
                   COMPUTE WS-M = WS-M / WS-P
                   COMPUTE WS-REM = FUNCTION MOD (WS-M, WS-P)
                   IF WS-REM = 0
                       MOVE 0 TO WS-RES
                       MOVE 1 TO WS-DONE
                   ELSE
                       COMPUTE WS-RES = 0 - WS-RES
                   END-IF
               END-IF
               ADD 1 TO WS-P
           END-PERFORM
           IF WS-DONE = 0 AND WS-M > 1
               COMPUTE WS-RES = 0 - WS-RES
           END-IF.
