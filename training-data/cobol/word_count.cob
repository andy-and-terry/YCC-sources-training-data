       IDENTIFICATION DIVISION.
       PROGRAM-ID. WORDCOUNT.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 TEXT-LINE   PIC X(60) VALUE "THE QUICK BROWN FOX JUMPS OVER THE LAZY DOG".
       01 WORD-COUNT  PIC 9(3) VALUE 0.
       01 CHAR-INDEX  PIC 9(3) VALUE 1.
       01 IN-WORD     PIC X VALUE "N".

       PROCEDURE DIVISION.
           PERFORM VARYING CHAR-INDEX FROM 1 BY 1
               UNTIL CHAR-INDEX > LENGTH OF TEXT-LINE
               IF TEXT-LINE(CHAR-INDEX:1) NOT = SPACE
                   IF IN-WORD = "N"
                       ADD 1 TO WORD-COUNT
                       MOVE "Y" TO IN-WORD
                   END-IF
               ELSE
                   MOVE "N" TO IN-WORD
               END-IF
           END-PERFORM
           DISPLAY "WORD COUNT: " WORD-COUNT
           STOP RUN.
