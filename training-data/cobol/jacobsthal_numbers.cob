      * Jacobsthal numbers: J0=0, J1=1, Jn = J(n-1) + 2*J(n-2)
       IDENTIFICATION DIVISION.
       PROGRAM-ID. JACOBSTHAL-NUMBERS.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-A     PIC 9(8) VALUE 0.
       01 WS-B     PIC 9(8) VALUE 1.
       01 WS-T     PIC 9(8).
       01 WS-I     PIC 99.
       01 WS-OUT   PIC Z(7)9.
       PROCEDURE DIVISION.
           PERFORM VARYING WS-I FROM 0 BY 1 UNTIL WS-I > 14
               MOVE WS-A TO WS-OUT
               DISPLAY "J(" WS-I ") = " WS-OUT
               COMPUTE WS-T = WS-B + 2 * WS-A
               MOVE WS-B TO WS-A
               MOVE WS-T TO WS-B
           END-PERFORM.
           STOP RUN.
