       IDENTIFICATION DIVISION.
       PROGRAM-ID. GOULD-SEQUENCE.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-N   PIC 99.
       01 WS-M   PIC 99.
       01 WS-C   PIC 99.
       01 WS-G   PIC 999.
       PROCEDURE DIVISION.
           PERFORM VARYING WS-N FROM 0 BY 1 UNTIL WS-N > 15
               MOVE WS-N TO WS-M
               MOVE 0 TO WS-C
               PERFORM UNTIL WS-M = 0
                   COMPUTE WS-C = WS-C + FUNCTION MOD(WS-M, 2)
                   COMPUTE WS-M = WS-M / 2
               END-PERFORM
               COMPUTE WS-G = 2 ** WS-C
               DISPLAY WS-G
           END-PERFORM
           STOP RUN.
