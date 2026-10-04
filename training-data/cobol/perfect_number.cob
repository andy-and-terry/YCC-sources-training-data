       IDENTIFICATION DIVISION.
       PROGRAM-ID. PERFECTNUMBER.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 CANDIDATE   PIC 9(5).
       01 D           PIC 9(5).
       01 Q           PIC 9(5).
       01 R           PIC 9(5).
       01 DIV-SUM     PIC 9(6).

       PROCEDURE DIVISION.
           PERFORM VARYING CANDIDATE FROM 2 BY 1 UNTIL CANDIDATE > 500
               MOVE 0 TO DIV-SUM
               PERFORM VARYING D FROM 1 BY 1 UNTIL D >= CANDIDATE
                   DIVIDE CANDIDATE BY D GIVING Q REMAINDER R
                   IF R = 0
                       ADD D TO DIV-SUM
                   END-IF
               END-PERFORM
               IF DIV-SUM = CANDIDATE
                   DISPLAY "PERFECT: " CANDIDATE
               END-IF
           END-PERFORM
           STOP RUN.
