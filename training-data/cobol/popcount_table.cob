      * Population count (number of set bits) for 0..15
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PopcountTable.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 N      PIC 99.
       01 X      PIC 99.
       01 BITS   PIC 9.

       PROCEDURE DIVISION.
           PERFORM VARYING N FROM 0 BY 1 UNTIL N > 15
               MOVE N TO X
               MOVE 0 TO BITS
               PERFORM UNTIL X = 0
                   COMPUTE BITS = BITS + FUNCTION MOD(X, 2)
                   COMPUTE X = X / 2
               END-PERFORM
               DISPLAY BITS
           END-PERFORM
           STOP RUN.
