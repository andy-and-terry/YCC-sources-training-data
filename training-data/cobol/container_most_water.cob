       IDENTIFICATION DIVISION.
       PROGRAM-ID. CONTAINER-MOST-WATER.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 H-DATA.
          05 FILLER PIC 9(2) VALUE 1.
          05 FILLER PIC 9(2) VALUE 8.
          05 FILLER PIC 9(2) VALUE 6.
          05 FILLER PIC 9(2) VALUE 2.
          05 FILLER PIC 9(2) VALUE 5.
          05 FILLER PIC 9(2) VALUE 4.
          05 FILLER PIC 9(2) VALUE 8.
          05 FILLER PIC 9(2) VALUE 3.
          05 FILLER PIC 9(2) VALUE 7.
       01 HEIGHTS REDEFINES H-DATA.
          05 H         PIC 9(2) OCCURS 9 TIMES.
       01 LO          PIC 9(2) VALUE 1.
       01 HI          PIC 9(2) VALUE 9.
       01 SHORTER     PIC 9(2).
       01 AREA-VAL    PIC 9(4).
       01 BEST        PIC 9(4) VALUE 0.

       PROCEDURE DIVISION.
           PERFORM UNTIL LO >= HI
               IF H(LO) < H(HI)
                   MOVE H(LO) TO SHORTER
               ELSE
                   MOVE H(HI) TO SHORTER
               END-IF
               COMPUTE AREA-VAL = SHORTER * (HI - LO)
               IF AREA-VAL > BEST
                   MOVE AREA-VAL TO BEST
               END-IF
               IF H(LO) < H(HI)
                   ADD 1 TO LO
               ELSE
                   SUBTRACT 1 FROM HI
               END-IF
           END-PERFORM
           DISPLAY "MAX AREA = " BEST
           STOP RUN.
