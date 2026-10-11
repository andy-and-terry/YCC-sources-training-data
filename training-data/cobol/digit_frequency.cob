       IDENTIFICATION DIVISION.
       PROGRAM-ID. DIGITFREQ.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 NUM-TEXT   PIC X(12) VALUE "122333444455".
       01 FREQ-TABLE.
          05 FREQ    PIC 99 OCCURS 10 TIMES VALUE 0.
       01 I          PIC 99.
       01 D          PIC 9.
       01 IDX        PIC 99.

       PROCEDURE DIVISION.
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 12
               MOVE NUM-TEXT(I:1) TO D
               COMPUTE IDX = D + 1
               ADD 1 TO FREQ(IDX)
           END-PERFORM
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 10
               IF FREQ(I) > 0
                   COMPUTE D = I - 1
                   DISPLAY "digit " D " occurs " FREQ(I)
               END-IF
           END-PERFORM
           STOP RUN.
