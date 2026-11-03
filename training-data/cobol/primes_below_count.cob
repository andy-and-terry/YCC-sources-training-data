       IDENTIFICATION DIVISION.
       PROGRAM-ID. PRIMES-BELOW-COUNT.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-LIMIT PIC 999 VALUE 100.
       01 WS-I     PIC 999.
       01 WS-J     PIC 9999.
       01 WS-COUNT PIC 999 VALUE 0.
       01 WS-FLAGS.
          05 WS-FLAG PIC 9 OCCURS 100 TIMES VALUE 0.
       PROCEDURE DIVISION.
           PERFORM VARYING WS-I FROM 2 BY 1 UNTIL WS-I >= WS-LIMIT
               IF WS-FLAG(WS-I) = 0
                   ADD 1 TO WS-COUNT
                   COMPUTE WS-J = WS-I * WS-I
                   PERFORM UNTIL WS-J >= WS-LIMIT
                       MOVE 1 TO WS-FLAG(WS-J)
                       ADD WS-I TO WS-J
                   END-PERFORM
               END-IF
           END-PERFORM
           DISPLAY WS-COUNT
           STOP RUN.
