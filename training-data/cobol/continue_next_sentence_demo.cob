       IDENTIFICATION DIVISION.
       PROGRAM-ID. CONTINUEDEMO.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 N        PIC 9(2).
       01 EVENS    PIC 9(3) VALUE 0.
       01 ODDS     PIC 9(3) VALUE 0.

       PROCEDURE DIVISION.
      * CONTINUE is a no-op statement: execution carries on with the
      * next statement after the END-IF.
           PERFORM VARYING N FROM 1 BY 1 UNTIL N > 10
               IF FUNCTION MOD(N, 2) = 0
                   CONTINUE
               ELSE
                   ADD N TO ODDS
               END-IF
               IF FUNCTION MOD(N, 2) = 0
                   ADD N TO EVENS
               END-IF
           END-PERFORM
           DISPLAY "SUM OF ODDS:  " ODDS
           DISPLAY "SUM OF EVENS: " EVENS

      * NEXT SENTENCE jumps to the statement after the next period,
      * which is why the period placement matters.
           MOVE 4 TO N
           IF N > 3
               NEXT SENTENCE
           ELSE
               DISPLAY "N IS SMALL"
           END-IF.
           DISPLAY "AFTER THE SENTENCE, N = " N
           STOP RUN.
