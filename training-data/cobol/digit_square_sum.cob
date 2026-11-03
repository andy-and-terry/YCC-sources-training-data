       IDENTIFICATION DIVISION.
       PROGRAM-ID. DIGIT-SQUARE-SUM.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-N     PIC 9(5) VALUE 123.
       01 WS-D     PIC 9.
       01 WS-SUM   PIC 9(5) VALUE 0.
       PROCEDURE DIVISION.
           PERFORM UNTIL WS-N = 0
               COMPUTE WS-D = FUNCTION MOD(WS-N, 10)
               COMPUTE WS-SUM = WS-SUM + WS-D * WS-D
               COMPUTE WS-N = WS-N / 10
           END-PERFORM
           DISPLAY WS-SUM
           STOP RUN.
