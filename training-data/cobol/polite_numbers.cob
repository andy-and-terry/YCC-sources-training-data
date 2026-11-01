       IDENTIFICATION DIVISION.
       PROGRAM-ID. POLITE-NUMBERS.
      * Ways to write N as a sum of two or more consecutive positives.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-N     PIC 99 VALUE 0.
       01 WS-K     PIC 99 VALUE 0.
       01 WS-REST  PIC S99 VALUE 0.
       01 WS-WAYS  PIC 99 VALUE 0.
       01 WS-OUT   PIC Z9.
       PROCEDURE DIVISION.
       MAIN-PARA.
           PERFORM VARYING WS-N FROM 1 BY 1 UNTIL WS-N > 16
               MOVE 0 TO WS-WAYS
               PERFORM VARYING WS-K FROM 2 BY 1
                       UNTIL WS-K * (WS-K + 1) / 2 > WS-N
                   COMPUTE WS-REST = WS-N - WS-K * (WS-K - 1) / 2
                   IF FUNCTION MOD (WS-REST, WS-K) = 0
                       ADD 1 TO WS-WAYS
                   END-IF
               END-PERFORM
               MOVE WS-WAYS TO WS-OUT
               DISPLAY WS-OUT WITH NO ADVANCING
           END-PERFORM.
           DISPLAY " ".
           STOP RUN.
