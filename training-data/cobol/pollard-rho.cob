       IDENTIFICATION DIVISION.
       PROGRAM-ID. POLLARD-RHO.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-N   PIC 9(9) VALUE 8051.
       01 WS-X   PIC 9(9) VALUE 2.
       01 WS-Y   PIC 9(9) VALUE 2.
       01 WS-D   PIC 9(9) VALUE 1.
       01 WS-A   PIC 9(9).
       01 WS-B   PIC 9(9).
       01 WS-T   PIC 9(9).
       PROCEDURE DIVISION.
           PERFORM UNTIL WS-D NOT = 1
               COMPUTE WS-X = FUNCTION MOD(WS-X * WS-X + 1, WS-N)
               COMPUTE WS-Y = FUNCTION MOD(WS-Y * WS-Y + 1, WS-N)
               COMPUTE WS-Y = FUNCTION MOD(WS-Y * WS-Y + 1, WS-N)
               COMPUTE WS-A = FUNCTION ABS(WS-X - WS-Y)
               MOVE WS-N TO WS-B
               PERFORM UNTIL WS-B = 0
                   COMPUTE WS-T = FUNCTION MOD(WS-A, WS-B)
                   MOVE WS-B TO WS-A
                   MOVE WS-T TO WS-B
               END-PERFORM
               MOVE WS-A TO WS-D
           END-PERFORM
           DISPLAY "FACTOR: " WS-D
           STOP RUN.
