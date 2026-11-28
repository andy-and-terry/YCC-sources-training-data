       IDENTIFICATION DIVISION.
       PROGRAM-ID. PATIENCE-LIS.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-VALUES.
          05 FILLER PIC 9(3) VALUE 10.
          05 FILLER PIC 9(3) VALUE 9.
          05 FILLER PIC 9(3) VALUE 2.
          05 FILLER PIC 9(3) VALUE 5.
          05 FILLER PIC 9(3) VALUE 3.
          05 FILLER PIC 9(3) VALUE 7.
          05 FILLER PIC 9(3) VALUE 101.
          05 FILLER PIC 9(3) VALUE 18.
       01 WS-ARR REDEFINES WS-VALUES.
          05 WS-A PIC 9(3) OCCURS 8 TIMES.
       01 WS-TAILS.
          05 WS-T PIC 9(3) OCCURS 8 TIMES VALUE 0.
       01 WS-LEN PIC 9 VALUE 0.
       01 WS-I   PIC 9.
       01 WS-J   PIC 9.
       PROCEDURE DIVISION.
           PERFORM VARYING WS-I FROM 1 BY 1 UNTIL WS-I > 8
               MOVE 1 TO WS-J
               PERFORM UNTIL WS-J > WS-LEN OR WS-T(WS-J) >= WS-A(WS-I)
                   ADD 1 TO WS-J
               END-PERFORM
               MOVE WS-A(WS-I) TO WS-T(WS-J)
               IF WS-J > WS-LEN
                   MOVE WS-J TO WS-LEN
               END-IF
           END-PERFORM
           DISPLAY "LIS LENGTH: " WS-LEN
           STOP RUN.
