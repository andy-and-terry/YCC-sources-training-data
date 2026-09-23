       IDENTIFICATION DIVISION.
       PROGRAM-ID. WORDFREQUENCY.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WORDS-TABLE.
           05 WORD-ITEM PIC X(10) OCCURS 8 TIMES.
       01 DISTINCT-TABLE.
           05 DISTINCT-ENTRY OCCURS 8 TIMES.
               10 DISTINCT-WORD  PIC X(10).
               10 DISTINCT-COUNT PIC 9(2).
       01 DISTINCT-TOTAL PIC 9(2) VALUE 0.
       01 I PIC 9(2).
       01 K PIC 9(2).
       01 FOUND-FLAG PIC X.

       PROCEDURE DIVISION.
           MOVE "THE"    TO WORD-ITEM(1)
           MOVE "QUICK"  TO WORD-ITEM(2)
           MOVE "FOX"    TO WORD-ITEM(3)
           MOVE "JUMPS"  TO WORD-ITEM(4)
           MOVE "THE"    TO WORD-ITEM(5)
           MOVE "QUICK"  TO WORD-ITEM(6)
           MOVE "DOG"    TO WORD-ITEM(7)
           MOVE "THE"    TO WORD-ITEM(8)

           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 8
               MOVE "N" TO FOUND-FLAG
               PERFORM VARYING K FROM 1 BY 1 UNTIL K > DISTINCT-TOTAL
                   IF DISTINCT-WORD(K) = WORD-ITEM(I)
                       ADD 1 TO DISTINCT-COUNT(K)
                       MOVE "Y" TO FOUND-FLAG
                   END-IF
               END-PERFORM
               IF FOUND-FLAG = "N"
                   ADD 1 TO DISTINCT-TOTAL
                   MOVE WORD-ITEM(I) TO DISTINCT-WORD(DISTINCT-TOTAL)
                   MOVE 1 TO DISTINCT-COUNT(DISTINCT-TOTAL)
               END-IF
           END-PERFORM

           PERFORM VARYING K FROM 1 BY 1 UNTIL K > DISTINCT-TOTAL
               DISPLAY DISTINCT-WORD(K) " " DISTINCT-COUNT(K)
           END-PERFORM
           STOP RUN.
