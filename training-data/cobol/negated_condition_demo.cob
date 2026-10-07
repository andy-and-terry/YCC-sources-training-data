       IDENTIFICATION DIVISION.
       PROGRAM-ID. NEGATED.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 A PIC 99 VALUE 15.
       01 B PIC 99 VALUE 20.
       01 NAME-IN PIC X(5) VALUE "ALPHA".

       PROCEDURE DIVISION.
           IF A NOT = B
               DISPLAY "A NOT EQUAL B"
           END-IF
           IF A NOT > B AND A NOT < 10
               DISPLAY "A BETWEEN 10 AND B"
           END-IF
           IF NOT (A > 50 OR B > 50)
               DISPLAY "NEITHER EXCEEDS 50"
           END-IF
           IF NAME-IN IS ALPHABETIC AND NAME-IN IS NOT NUMERIC
               DISPLAY "NAME IS ALPHABETIC"
           END-IF
           STOP RUN.
