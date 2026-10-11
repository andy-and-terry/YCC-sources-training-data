       IDENTIFICATION DIVISION.
       PROGRAM-ID. STRCOMPARE.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 S1   PIC X(8) VALUE "APPLE".
       01 S2   PIC X(8) VALUE "BANANA".
       01 S3   PIC X(8) VALUE "APPLE".

       PROCEDURE DIVISION.
           IF S1 = S3 DISPLAY "S1 equals S3" END-IF
           IF S1 < S2 DISPLAY "S1 sorts before S2" END-IF
           IF S2 NOT = S1 DISPLAY "S2 differs from S1" END-IF
           IF S1 = "APPLE" DISPLAY "padding ignored in compare" END-IF
           STOP RUN.
