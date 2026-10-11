       IDENTIFICATION DIVISION.
       PROGRAM-ID. POWTWO.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 K     PIC 99.
       01 P     PIC 9(10) VALUE 1.

       PROCEDURE DIVISION.
           PERFORM VARYING K FROM 0 BY 1 UNTIL K > 16
               DISPLAY "2^" K " = " P
               MULTIPLY 2 BY P
           END-PERFORM
           STOP RUN.
