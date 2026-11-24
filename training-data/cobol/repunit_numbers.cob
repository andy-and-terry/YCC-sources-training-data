       IDENTIFICATION DIVISION.
       PROGRAM-ID. REPUNIT-NUMBERS.
      * Repunits: R_n = 11...1 (n ones), built as R_{n-1}*10 + 1.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-N       PIC 99 VALUE 0.
       01 WS-R       PIC 9(9) VALUE 0.
       01 WS-REM     PIC 9 VALUE 0.
       01 WS-OUT     PIC Z(8)9.
       PROCEDURE DIVISION.
           PERFORM VARYING WS-N FROM 1 BY 1 UNTIL WS-N > 8
               COMPUTE WS-R = WS-R * 10 + 1
               MOVE WS-R TO WS-OUT
               COMPUTE WS-REM = FUNCTION MOD (WS-R, 3)
               IF WS-REM = 0
                   DISPLAY WS-OUT "  (divisible by 3)"
               ELSE
                   DISPLAY WS-OUT
               END-IF
           END-PERFORM
           STOP RUN.
