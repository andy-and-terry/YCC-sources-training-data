       IDENTIFICATION DIVISION.
       PROGRAM-ID. MIAN-CHOWLA-SEQUENCE.
      * Greedy sequence whose pairwise sums are all distinct.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-SEQ.
          05 WS-TERM  PIC 999 OCCURS 8 TIMES VALUE 0.
       01 WS-USED.
          05 WS-U     PIC 9 OCCURS 200 TIMES VALUE 0.
       01 WS-FRESH.
          05 WS-F     PIC 9 OCCURS 200 TIMES VALUE 0.
       01 WS-N      PIC 99 VALUE 0.
       01 WS-CAND   PIC 999 VALUE 1.
       01 WS-I      PIC 99 VALUE 0.
       01 WS-S      PIC 999 VALUE 0.
       01 WS-OK     PIC 9 VALUE 1.
       01 WS-OUT    PIC ZZ9.
       PROCEDURE DIVISION.
       MAIN-PARA.
           PERFORM UNTIL WS-N = 8
               MOVE ALL "0" TO WS-FRESH
               MOVE 1 TO WS-OK
               COMPUTE WS-I = WS-N + 1
               MOVE WS-CAND TO WS-TERM (WS-I)
               PERFORM VARYING WS-I FROM 1 BY 1 UNTIL WS-I > WS-N + 1
                   COMPUTE WS-S = WS-TERM (WS-I) + WS-CAND
                   IF WS-U (WS-S) = 1 OR WS-F (WS-S) = 1
                       MOVE 0 TO WS-OK
                   ELSE
                       MOVE 1 TO WS-F (WS-S)
                   END-IF
               END-PERFORM
               IF WS-OK = 1
                   PERFORM VARYING WS-S FROM 1 BY 1 UNTIL WS-S > 200
                       IF WS-F (WS-S) = 1
                           MOVE 1 TO WS-U (WS-S)
                       END-IF
                   END-PERFORM
                   ADD 1 TO WS-N
               END-IF
               ADD 1 TO WS-CAND
           END-PERFORM.
           PERFORM VARYING WS-I FROM 1 BY 1 UNTIL WS-I > 8
               MOVE WS-TERM (WS-I) TO WS-OUT
               DISPLAY WS-OUT WITH NO ADVANCING
           END-PERFORM.
           DISPLAY " ".
           STOP RUN.
