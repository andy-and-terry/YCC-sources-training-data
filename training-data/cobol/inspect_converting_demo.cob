       IDENTIFICATION DIVISION.
       PROGRAM-ID. INSPCONV.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 TEXT-A PIC X(20) VALUE "hello world".
       01 TEXT-B PIC X(20) VALUE "a-b-c-d".

       PROCEDURE DIVISION.
           INSPECT TEXT-A CONVERTING
               "abcdefghijklmnopqrstuvwxyz"
               TO "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
           DISPLAY TEXT-A
           INSPECT TEXT-B REPLACING ALL "-" BY "+"
           DISPLAY TEXT-B
           INSPECT TEXT-B REPLACING FIRST "+" BY "*"
           DISPLAY TEXT-B
           STOP RUN.
