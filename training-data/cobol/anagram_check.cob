       IDENTIFICATION DIVISION.
       PROGRAM-ID. ANAGRAMCHECK.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WORD-ONE PIC X(10) VALUE "listen".
       01 WORD-TWO PIC X(10) VALUE "silent".
       01 COUNTS-ONE.
           05 COUNT-ONE-CELL PIC 9(2) OCCURS 26 TIMES VALUE 0.
       01 COUNTS-TWO.
           05 COUNT-TWO-CELL PIC 9(2) OCCURS 26 TIMES VALUE 0.
       01 I PIC 9(2).
       01 CH PIC X.
       01 POS PIC 9(2).
       01 IS-ANAGRAM PIC X VALUE "Y".

       PROCEDURE DIVISION.
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 10
               MOVE WORD-ONE(I:1) TO CH
               IF CH NOT = SPACE
                   COMPUTE POS = FUNCTION ORD(CH) - FUNCTION ORD("a") + 1
                   ADD 1 TO COUNT-ONE-CELL(POS)
               END-IF
           END-PERFORM

           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 10
               MOVE WORD-TWO(I:1) TO CH
               IF CH NOT = SPACE
                   COMPUTE POS = FUNCTION ORD(CH) - FUNCTION ORD("a") + 1
                   ADD 1 TO COUNT-TWO-CELL(POS)
               END-IF
           END-PERFORM

           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 26
               IF COUNT-ONE-CELL(I) NOT = COUNT-TWO-CELL(I)
                   MOVE "N" TO IS-ANAGRAM
               END-IF
           END-PERFORM

           DISPLAY "IS ANAGRAM: " IS-ANAGRAM
           STOP RUN.
