       IDENTIFICATION DIVISION.
       PROGRAM-ID. REVWORDS.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 TXT     PIC X(11) VALUE "HELLO WORLD".
       01 OUT-TXT PIC X(11).
       01 I       PIC 99.
       01 J       PIC 99.

       PROCEDURE DIVISION.
           MOVE 11 TO J
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 11
               MOVE TXT(I:1) TO OUT-TXT(J:1)
               SUBTRACT 1 FROM J
           END-PERFORM
           DISPLAY TXT " -> " OUT-TXT
           STOP RUN.
