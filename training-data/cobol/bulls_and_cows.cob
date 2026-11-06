       IDENTIFICATION DIVISION.
       PROGRAM-ID. BULLSCOWS.
      * Bulls and Cows scoring for equal-length digit strings.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 SECRET   PIC X(4) VALUE "1807".
       01 GUESS    PIC X(4) VALUE "7810".
       01 I        PIC 9.
       01 J        PIC 9.
       01 BULLS    PIC 9 VALUE 0.
       01 COWS     PIC 9 VALUE 0.
       01 USED-TABLE.
          05 USED  PIC 9 OCCURS 4 TIMES VALUE 0.
       PROCEDURE DIVISION.
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 4
               IF SECRET(I:1) = GUESS(I:1)
                   ADD 1 TO BULLS
                   MOVE 1 TO USED(I)
               END-IF
           END-PERFORM
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 4
               IF SECRET(I:1) NOT = GUESS(I:1)
                   PERFORM VARYING J FROM 1 BY 1 UNTIL J > 4
                       IF USED(J) = 0 AND SECRET(J:1) = GUESS(I:1)
                           ADD 1 TO COWS
                           MOVE 1 TO USED(J)
                           MOVE 5 TO J
                       END-IF
                   END-PERFORM
               END-IF
           END-PERFORM
           DISPLAY BULLS " bull(s), " COWS " cow(s)"
           STOP RUN.
