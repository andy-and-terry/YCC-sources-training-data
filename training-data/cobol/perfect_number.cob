       IDENTIFICATION DIVISION.
       PROGRAM-ID. PERFECTNUM.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 N PIC 9(4).
       01 D PIC 9(4).
       01 TOTAL PIC 9(5).
       01 Q PIC 9(4).
       01 R PIC 9(4).

       PROCEDURE DIVISION.
           PERFORM VARYING N FROM 2 BY 1 UNTIL N > 500
               MOVE 0 TO TOTAL
               PERFORM VARYING D FROM 1 BY 1 UNTIL D >= N
                   DIVIDE N BY D GIVING Q REMAINDER R
                   IF R = 0
                       ADD D TO TOTAL
                   END-IF
               END-PERFORM
               IF TOTAL = N
                   DISPLAY "PERFECT: " N
               END-IF
           END-PERFORM
           STOP RUN.
