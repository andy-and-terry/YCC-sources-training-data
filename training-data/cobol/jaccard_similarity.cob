       IDENTIFICATION DIVISION.
       PROGRAM-ID. JACCARD.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 SET-A-DATA PIC X(10) VALUE "0011110000".
       01 SET-A REDEFINES SET-A-DATA.
          05 A-FLAG PIC 9 OCCURS 10.
       01 SET-B-DATA PIC X(10) VALUE "0000111000".
       01 SET-B REDEFINES SET-B-DATA.
          05 B-FLAG PIC 9 OCCURS 10.
       01 I     PIC 99.
       01 INTER PIC 99 VALUE 0.
       01 UNI   PIC 99 VALUE 0.
       01 RATIO PIC 9.99.

       PROCEDURE DIVISION.
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 10
               IF A-FLAG (I) = 1 AND B-FLAG (I) = 1
                   ADD 1 TO INTER
               END-IF
               IF A-FLAG (I) = 1 OR B-FLAG (I) = 1
                   ADD 1 TO UNI
               END-IF
           END-PERFORM
           COMPUTE RATIO = INTER / UNI
           DISPLAY "JACCARD = " RATIO
           STOP RUN.
