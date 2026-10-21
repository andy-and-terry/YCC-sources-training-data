       IDENTIFICATION DIVISION.
       PROGRAM-ID. PELL-NUMBERS.
      * Print the first 15 Pell numbers: P(n) = 2*P(n-1) + P(n-2)
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-A     PIC 9(9) VALUE 0.
       01 WS-B     PIC 9(9) VALUE 1.
       01 WS-T     PIC 9(9).
       01 WS-I     PIC 99.
       01 WS-SHOW  PIC Z(8)9.
       PROCEDURE DIVISION.
           PERFORM VARYING WS-I FROM 0 BY 1 UNTIL WS-I > 14
               MOVE WS-A TO WS-SHOW
               DISPLAY "P(" WS-I ") = " WS-SHOW
               COMPUTE WS-T = 2 * WS-B + WS-A
               MOVE WS-B TO WS-A
               MOVE WS-T TO WS-B
           END-PERFORM
           STOP RUN.
