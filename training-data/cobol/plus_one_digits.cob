       IDENTIFICATION DIVISION.
       PROGRAM-ID. PLUS-ONE-DIGITS.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Number is held right-aligned in five digits: 00129.
       01 DIGITS.
          05 DIGIT     PIC 9 OCCURS 5 TIMES.
       01 DIGITS-INIT REDEFINES DIGITS PIC 9(5).
       01 I           PIC S9 VALUE 5.
       01 DONE-FLAG   PIC X VALUE "N".

       PROCEDURE DIVISION.
           MOVE 129 TO DIGITS-INIT
           MOVE 5 TO I
           PERFORM UNTIL I < 1 OR DONE-FLAG = "Y"
               IF DIGIT(I) < 9
                   ADD 1 TO DIGIT(I)
                   MOVE "Y" TO DONE-FLAG
               ELSE
                   MOVE 0 TO DIGIT(I)
                   SUBTRACT 1 FROM I
               END-IF
           END-PERFORM
           DISPLAY DIGITS
           STOP RUN.
