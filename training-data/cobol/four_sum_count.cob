       IDENTIFICATION DIVISION.
       PROGRAM-ID. FOUR-SUM-COUNT.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 A-DATA.
          05 FILLER PIC S9(2) VALUE 1.
          05 FILLER PIC S9(2) VALUE 2.
       01 A-TAB REDEFINES A-DATA.
          05 A         PIC S9(2) OCCURS 2 TIMES.
       01 B-DATA.
          05 FILLER PIC S9(2) VALUE -2.
          05 FILLER PIC S9(2) VALUE -1.
       01 B-TAB REDEFINES B-DATA.
          05 B         PIC S9(2) OCCURS 2 TIMES.
       01 C-DATA.
          05 FILLER PIC S9(2) VALUE -1.
          05 FILLER PIC S9(2) VALUE 2.
       01 C-TAB REDEFINES C-DATA.
          05 C         PIC S9(2) OCCURS 2 TIMES.
       01 D-DATA.
          05 FILLER PIC S9(2) VALUE 0.
          05 FILLER PIC S9(2) VALUE 2.
       01 D-TAB REDEFINES D-DATA.
          05 D         PIC S9(2) OCCURS 2 TIMES.
       01 I           PIC 9.
       01 J           PIC 9.
       01 K           PIC 9.
       01 L           PIC 9.
       01 TOTAL       PIC S9(3).
       01 TUPLES      PIC 9(3) VALUE 0.

       PROCEDURE DIVISION.
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 2
             PERFORM VARYING J FROM 1 BY 1 UNTIL J > 2
               PERFORM VARYING K FROM 1 BY 1 UNTIL K > 2
                 PERFORM VARYING L FROM 1 BY 1 UNTIL L > 2
                   COMPUTE TOTAL = A(I) + B(J) + C(K) + D(L)
                   IF TOTAL = 0
                       ADD 1 TO TUPLES
                   END-IF
                 END-PERFORM
               END-PERFORM
             END-PERFORM
           END-PERFORM
           DISPLAY "TUPLES = " TUPLES
           STOP RUN.
