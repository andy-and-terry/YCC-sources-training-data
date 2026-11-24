       IDENTIFICATION DIVISION.
       PROGRAM-ID. ALIQUOT-SEQUENCE.
      * Aliquot sequence: replace n by the sum of its proper divisors.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-N       PIC 9(4) VALUE 12.
       01 WS-D       PIC 9(4) VALUE 0.
       01 WS-HALF    PIC 9(4) VALUE 0.
       01 WS-SUM     PIC 9(4) VALUE 0.
       01 WS-COUNT   PIC 99 VALUE 0.
       01 WS-REM     PIC 9(4) VALUE 0.
       01 WS-OUT     PIC ZZZ9.
       PROCEDURE DIVISION.
           MOVE WS-N TO WS-OUT
           DISPLAY WS-OUT " " WITH NO ADVANCING
           PERFORM UNTIL WS-N <= 1 OR WS-COUNT >= 19
               PERFORM ALIQUOT-SUM
               MOVE WS-SUM TO WS-N
               MOVE WS-N TO WS-OUT
               DISPLAY WS-OUT " " WITH NO ADVANCING
               ADD 1 TO WS-COUNT
           END-PERFORM
           DISPLAY " "
           STOP RUN.
       ALIQUOT-SUM.
           MOVE 0 TO WS-SUM
           COMPUTE WS-HALF = WS-N / 2
           PERFORM VARYING WS-D FROM 1 BY 1 UNTIL WS-D > WS-HALF
               COMPUTE WS-REM = FUNCTION MOD (WS-N, WS-D)
               IF WS-REM = 0
                   ADD WS-D TO WS-SUM
               END-IF
           END-PERFORM.
