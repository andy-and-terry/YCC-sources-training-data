       IDENTIFICATION DIVISION.
       PROGRAM-ID. FACTORION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 N        PIC 9(5).
       01 M        PIC 9(5).
       01 TOTAL    PIC 9(6).
       01 D        PIC 9.
       01 FACT-TABLE.
          05 FILLER PIC 9(6) VALUE 1.
          05 FILLER PIC 9(6) VALUE 1.
          05 FILLER PIC 9(6) VALUE 2.
          05 FILLER PIC 9(6) VALUE 6.
          05 FILLER PIC 9(6) VALUE 24.
          05 FILLER PIC 9(6) VALUE 120.
          05 FILLER PIC 9(6) VALUE 720.
          05 FILLER PIC 9(6) VALUE 5040.
          05 FILLER PIC 9(6) VALUE 40320.
          05 FILLER PIC 9(6) VALUE 362880.
       01 FACT REDEFINES FACT-TABLE.
          05 F PIC 9(6) OCCURS 10 TIMES.
       PROCEDURE DIVISION.
           PERFORM VARYING N FROM 1 BY 1 UNTIL N > 49999
               MOVE N TO M
               MOVE 0 TO TOTAL
               PERFORM UNTIL M = 0
                   COMPUTE D = FUNCTION MOD(M, 10)
                   ADD F(D + 1) TO TOTAL
                   COMPUTE M = M / 10
               END-PERFORM
               IF TOTAL = N
                   DISPLAY N
               END-IF
           END-PERFORM
           STOP RUN.
