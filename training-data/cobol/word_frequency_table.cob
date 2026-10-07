       IDENTIFICATION DIVISION.
       PROGRAM-ID. WORDFREQTABLE.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WORDS-TBL.
           05 WORD-ITEM PIC X(6) OCCURS 6 TIMES
               VALUES "THE   " "FOX   " "THE   " "DOG   "
                      "THE   " "FOX   ".
       01 UNIQUE-TBL.
           05 UNIQUE-ITEM.
               10 UNIQUE-WORD PIC X(6).
               10 UNIQUE-COUNT PIC 9(2) VALUE 0.
           OCCURS 6 TIMES INDEXED BY U-IDX.
       01 UNIQUE-TOTAL PIC 9(2) VALUE 0.
       01 I PIC 9(2).
       01 FOUND-FLAG PIC X VALUE "N".

       PROCEDURE DIVISION.
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 6
               MOVE "N" TO FOUND-FLAG
               PERFORM VARYING U-IDX FROM 1 BY 1
                       UNTIL U-IDX > UNIQUE-TOTAL
                   IF UNIQUE-WORD(U-IDX) = WORD-ITEM(I)
                       ADD 1 TO UNIQUE-COUNT(U-IDX)
                       MOVE "Y" TO FOUND-FLAG
                   END-IF
               END-PERFORM
               IF FOUND-FLAG = "N"
                   ADD 1 TO UNIQUE-TOTAL
                   MOVE WORD-ITEM(I) TO UNIQUE-WORD(UNIQUE-TOTAL)
                   MOVE 1 TO UNIQUE-COUNT(UNIQUE-TOTAL)
               END-IF
           END-PERFORM

           PERFORM VARYING U-IDX FROM 1 BY 1 UNTIL U-IDX > UNIQUE-TOTAL
               DISPLAY FUNCTION TRIM(UNIQUE-WORD(U-IDX))
                   ": " UNIQUE-COUNT(U-IDX)
           END-PERFORM
           STOP RUN.
