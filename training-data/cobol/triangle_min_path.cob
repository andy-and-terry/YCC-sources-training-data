       IDENTIFICATION DIVISION.
       PROGRAM-ID. TRIANGLE-MIN-PATH.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 T-DATA.
          05 FILLER PIC 9(2) VALUE 2.
          05 FILLER PIC X(6) VALUE "000000".
          05 FILLER PIC 9(2) VALUE 3.
          05 FILLER PIC 9(2) VALUE 4.
          05 FILLER PIC X(4) VALUE "0000".
          05 FILLER PIC 9(2) VALUE 6.
          05 FILLER PIC 9(2) VALUE 5.
          05 FILLER PIC 9(2) VALUE 7.
          05 FILLER PIC X(2) VALUE "00".
          05 FILLER PIC 9(2) VALUE 4.
          05 FILLER PIC 9(2) VALUE 1.
          05 FILLER PIC 9(2) VALUE 8.
          05 FILLER PIC 9(2) VALUE 3.
       01 TRI REDEFINES T-DATA.
          05 ROW OCCURS 4 TIMES.
             10 CELL    PIC 9(2) OCCURS 4 TIMES.
       01 DP-TABLE.
          05 DP        PIC 9(3) OCCURS 4 TIMES.
       01 R           PIC S9.
       01 I           PIC 9.
       01 SMALLER     PIC 9(3).

       PROCEDURE DIVISION.
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 4
               MOVE CELL(4, I) TO DP(I)
           END-PERFORM
           PERFORM VARYING R FROM 3 BY -1 UNTIL R < 1
               PERFORM VARYING I FROM 1 BY 1 UNTIL I > R
                   IF DP(I) < DP(I + 1)
                       MOVE DP(I) TO SMALLER
                   ELSE
                       MOVE DP(I + 1) TO SMALLER
                   END-IF
                   COMPUTE DP(I) = CELL(R, I) + SMALLER
               END-PERFORM
           END-PERFORM
           DISPLAY "MIN PATH = " DP(1)
           STOP RUN.
