       IDENTIFICATION DIVISION.
       PROGRAM-ID. LYCHREL-STEPS.
      * Reverse-and-add until a palindrome; count the steps.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-STARTS.
          05 FILLER PIC 99 VALUE 56.
          05 FILLER PIC 99 VALUE 57.
          05 FILLER PIC 99 VALUE 59.
          05 FILLER PIC 99 VALUE 79.
          05 FILLER PIC 99 VALUE 89.
       01 WS-TABLE REDEFINES WS-STARTS.
          05 WS-START PIC 99 OCCURS 5 TIMES.
       01 WS-I      PIC 9 VALUE 0.
       01 WS-N      PIC 9(15) VALUE 0.
       01 WS-REV    PIC 9(15) VALUE 0.
       01 WS-T      PIC 9(15) VALUE 0.
       01 WS-COUNT  PIC 99 VALUE 0.
       01 WS-DONE   PIC 9 VALUE 0.
       01 WS-OUT    PIC Z9.
       PROCEDURE DIVISION.
       MAIN-PARA.
           PERFORM VARYING WS-I FROM 1 BY 1 UNTIL WS-I > 5
               MOVE WS-START (WS-I) TO WS-N
               MOVE 0 TO WS-COUNT
               MOVE 0 TO WS-DONE
               PERFORM UNTIL WS-DONE = 1
                   PERFORM REVERSE-N
                   IF WS-COUNT > 0 AND WS-REV = WS-N
                       MOVE 1 TO WS-DONE
                   ELSE
                       ADD WS-REV TO WS-N
                       ADD 1 TO WS-COUNT
                   END-IF
               END-PERFORM
               MOVE WS-COUNT TO WS-OUT
               DISPLAY WS-OUT WITH NO ADVANCING
           END-PERFORM.
           DISPLAY " ".
           STOP RUN.
       REVERSE-N.
           MOVE WS-N TO WS-T
           MOVE 0 TO WS-REV
           PERFORM UNTIL WS-T = 0
               COMPUTE WS-REV = WS-REV * 10 + FUNCTION MOD (WS-T, 10)
               COMPUTE WS-T = WS-T / 10
           END-PERFORM.
