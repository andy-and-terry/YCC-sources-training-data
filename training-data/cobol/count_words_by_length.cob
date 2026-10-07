       IDENTIFICATION DIVISION.
       PROGRAM-ID. WORDSBYLENGTH.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WORDS-TBL.
           05 WORD-ITEM PIC X(8) OCCURS 5 TIMES
               VALUES "CAT     " "ELEPHANT" "DOG     "
                      "OWL     " "BUTTERFLY".
       01 LENGTH-BUCKET.
           05 BUCKET-COUNT PIC 9(2) OCCURS 10 TIMES.
       01 I PIC 9(1).
       01 WORD-LEN PIC 9(2).
       01 B PIC 9(2).

       PROCEDURE DIVISION.
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 5
               COMPUTE WORD-LEN =
                   FUNCTION LENGTH(FUNCTION TRIM(WORD-ITEM(I)))
               ADD 1 TO BUCKET-COUNT(WORD-LEN)
           END-PERFORM

           PERFORM VARYING B FROM 1 BY 1 UNTIL B > 10
               IF BUCKET-COUNT(B) > 0
                   DISPLAY "LENGTH " B ": " BUCKET-COUNT(B) " WORDS"
               END-IF
           END-PERFORM
           STOP RUN.
