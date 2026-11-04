       IDENTIFICATION DIVISION.
       PROGRAM-ID. GCD-EUCLID-DEMO.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-A    PIC 9(6) VALUE 48.
       01 WS-B    PIC 9(6) VALUE 180.
       01 WS-T    PIC 9(6).
       PROCEDURE DIVISION.
       MAIN-PARA.
           PERFORM UNTIL WS-B = 0
               COMPUTE WS-T = FUNCTION MOD(WS-A, WS-B)
               MOVE WS-B TO WS-A
               MOVE WS-T TO WS-B
           END-PERFORM
           DISPLAY "GCD = " WS-A
           STOP RUN.
