       IDENTIFICATION DIVISION.
       PROGRAM-ID. NESTEDIFGRADING.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 SCORE PIC 9(3) VALUE 85.
       01 GRADE PIC X.

       PROCEDURE DIVISION.
           IF SCORE >= 90
               MOVE "A" TO GRADE
           ELSE
               IF SCORE >= 80
                   MOVE "B" TO GRADE
               ELSE
                   IF SCORE >= 70
                       MOVE "C" TO GRADE
                   ELSE
                       MOVE "F" TO GRADE
                   END-IF
               END-IF
           END-IF
           DISPLAY "GRADE: " GRADE
           STOP RUN.
