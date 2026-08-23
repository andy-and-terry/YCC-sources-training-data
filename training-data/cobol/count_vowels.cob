       IDENTIFICATION DIVISION.
       PROGRAM-ID. COUNTVOWELS.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 SOURCE-STR PIC X(11) VALUE "HELLOWORLD ".
       01 I PIC 9(2).
       01 COUNT PIC 9(2) VALUE 0.
       01 CH PIC X.

       PROCEDURE DIVISION.
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 10
               MOVE SOURCE-STR(I:1) TO CH
               EVALUATE CH
                   WHEN "A" WHEN "E" WHEN "I" WHEN "O" WHEN "U"
                       ADD 1 TO COUNT
               END-EVALUATE
           END-PERFORM
           DISPLAY "VOWELS: " COUNT
           STOP RUN.
