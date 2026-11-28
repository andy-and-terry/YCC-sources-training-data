       IDENTIFICATION DIVISION.
       PROGRAM-ID. SINGLE-NUMBER-COUNT.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 NUMS-DATA.
          05 FILLER PIC 9 VALUE 4.
          05 FILLER PIC 9 VALUE 1.
          05 FILLER PIC 9 VALUE 2.
          05 FILLER PIC 9 VALUE 1.
          05 FILLER PIC 9 VALUE 2.
       01 NUMS REDEFINES NUMS-DATA.
          05 NUM       PIC 9 OCCURS 5 TIMES.
       01 TALLY-TABLE.
          05 TALLY     PIC 9 OCCURS 10 TIMES VALUE 0.
       01 I           PIC 99.
       01 SLOT        PIC 99.

       PROCEDURE DIVISION.
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 5
               COMPUTE SLOT = NUM(I) + 1
               ADD 1 TO TALLY(SLOT)
           END-PERFORM
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 10
               IF TALLY(I) = 1
                   COMPUTE SLOT = I - 1
                   DISPLAY "SINGLE = " SLOT
               END-IF
           END-PERFORM
           STOP RUN.
