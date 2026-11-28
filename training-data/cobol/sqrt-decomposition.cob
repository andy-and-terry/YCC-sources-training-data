       IDENTIFICATION DIVISION.
       PROGRAM-ID. SQRT-DECOMP.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-VALS.
          05 FILLER PIC 99 VALUE 5.
          05 FILLER PIC 99 VALUE 3.
          05 FILLER PIC 99 VALUE 8.
          05 FILLER PIC 99 VALUE 1.
          05 FILLER PIC 99 VALUE 9.
          05 FILLER PIC 99 VALUE 2.
          05 FILLER PIC 99 VALUE 7.
          05 FILLER PIC 99 VALUE 4.
          05 FILLER PIC 99 VALUE 6.
          05 FILLER PIC 99 VALUE 0.
          05 FILLER PIC 99 VALUE 3.
          05 FILLER PIC 99 VALUE 5.
       01 WS-A REDEFINES WS-VALS.
          05 WS-E PIC 99 OCCURS 12 TIMES.
       01 WS-BLK.
          05 WS-B PIC 999 OCCURS 3 TIMES VALUE 0.
       01 WS-I   PIC 99.
       01 WS-K   PIC 9.
       01 WS-SUM PIC 999 VALUE 0.
       PROCEDURE DIVISION.
           PERFORM VARYING WS-I FROM 1 BY 1 UNTIL WS-I > 12
               COMPUTE WS-K = (WS-I - 1) / 4 + 1
               ADD WS-E(WS-I) TO WS-B(WS-K)
           END-PERFORM
      *    query elements 3..10 (1-based): 1 partial block, 1 full
           ADD WS-E(3) WS-E(4) TO WS-SUM
           ADD WS-B(2) TO WS-SUM
           ADD WS-E(9) WS-E(10) TO WS-SUM
           DISPLAY "SUM: " WS-SUM
           STOP RUN.
