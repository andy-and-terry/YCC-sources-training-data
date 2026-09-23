       IDENTIFICATION DIVISION.
       PROGRAM-ID. CONDITIONRANGEDEMO.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 TEST-SCORE PIC 9(3) VALUE 0.
           88 GRADE-A VALUE 90 THRU 100.
           88 GRADE-B VALUE 80 THRU 89.
           88 GRADE-C VALUE 70 THRU 79.
           88 GRADE-F VALUE 0 THRU 69.
       01 SAMPLE-SCORES.
           05 SAMPLE-SCORE PIC 9(3) OCCURS 4 TIMES.
       01 I PIC 9(2).

       PROCEDURE DIVISION.
           MOVE 95 TO SAMPLE-SCORE(1)
           MOVE 82 TO SAMPLE-SCORE(2)
           MOVE 71 TO SAMPLE-SCORE(3)
           MOVE 40 TO SAMPLE-SCORE(4)

           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 4
               MOVE SAMPLE-SCORE(I) TO TEST-SCORE
               DISPLAY "SCORE: " TEST-SCORE
               IF GRADE-A
                   DISPLAY "  GRADE: A"
               END-IF
               IF GRADE-B
                   DISPLAY "  GRADE: B"
               END-IF
               IF GRADE-C
                   DISPLAY "  GRADE: C"
               END-IF
               IF GRADE-F
                   DISPLAY "  GRADE: F"
               END-IF
           END-PERFORM
           STOP RUN.
