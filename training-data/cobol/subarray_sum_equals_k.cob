       IDENTIFICATION DIVISION.
       PROGRAM-ID. SUBSUMK.
      * Count contiguous subarrays whose sum equals K (running sums).
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 NUMS-DATA.
          05 FILLER PIC S9 VALUE 1.
          05 FILLER PIC S9 VALUE 1.
          05 FILLER PIC S9 VALUE 1.
       01 NUMS REDEFINES NUMS-DATA.
          05 NUM      PIC S9 OCCURS 3 TIMES.
       01 K           PIC S9 VALUE 2.
       01 I           PIC 9.
       01 J           PIC 9.
       01 TOTAL       PIC S9(3).
       01 CNT         PIC 99 VALUE 0.
       PROCEDURE DIVISION.
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 3
               MOVE 0 TO TOTAL
               PERFORM VARYING J FROM I BY 1 UNTIL J > 3
                   ADD NUM(J) TO TOTAL
                   IF TOTAL = K
                       ADD 1 TO CNT
                   END-IF
               END-PERFORM
           END-PERFORM
           DISPLAY CNT
           STOP RUN.
