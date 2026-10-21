       IDENTIFICATION DIVISION.
       PROGRAM-ID. TRIBONACCI-NUMBERS.
      * Tribonacci: T0=0, T1=0, T2=1, T(n) = T(n-1) + T(n-2) + T(n-3)
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-A     PIC 9(9) VALUE 0.
       01 WS-B     PIC 9(9) VALUE 0.
       01 WS-C     PIC 9(9) VALUE 1.
       01 WS-NEXT  PIC 9(9).
       01 WS-I     PIC 99.
       01 WS-OUT   PIC Z(8)9.
       PROCEDURE DIVISION.
           DISPLAY "Tribonacci numbers:"
           PERFORM VARYING WS-I FROM 1 BY 1 UNTIL WS-I > 15
               MOVE WS-A TO WS-OUT
               DISPLAY WS-OUT
               COMPUTE WS-NEXT = WS-A + WS-B + WS-C
               MOVE WS-B TO WS-A
               MOVE WS-C TO WS-B
               MOVE WS-NEXT TO WS-C
           END-PERFORM
           STOP RUN.
