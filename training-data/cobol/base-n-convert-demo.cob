       IDENTIFICATION DIVISION.
       PROGRAM-ID. BASE-N-CONVERT-DEMO.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-DIGITS   PIC X(16) VALUE "0123456789ABCDEF".
       01 WS-N        PIC 9(6)  VALUE 255.
       01 WS-BASE     PIC 9(2)  VALUE 16.
       01 WS-D        PIC 9(2).
       01 WS-OUT      PIC X(20) VALUE SPACES.
       01 WS-POS      PIC 9(2)  VALUE 20.
       PROCEDURE DIVISION.
       MAIN-PARA.
           PERFORM UNTIL WS-N = 0
               COMPUTE WS-D = FUNCTION MOD(WS-N, WS-BASE)
               MOVE WS-DIGITS(WS-D + 1:1) TO WS-OUT(WS-POS:1)
               SUBTRACT 1 FROM WS-POS
               COMPUTE WS-N = WS-N / WS-BASE
           END-PERFORM
           DISPLAY "255 in base 16 = " WS-OUT(WS-POS + 1:)
           STOP RUN.
