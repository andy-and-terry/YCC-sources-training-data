       IDENTIFICATION DIVISION.
       PROGRAM-ID. PREFIXSUM.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 DATA-AREA.
          05 VALS  PIC 9(3) OCCURS 6 TIMES.
       01 PREFIX-AREA.
          05 PFX   PIC 9(4) OCCURS 6 TIMES.
       01 I        PIC 9.

       PROCEDURE DIVISION.
           MOVE 3 TO VALS(1)
           MOVE 1 TO VALS(2)
           MOVE 4 TO VALS(3)
           MOVE 1 TO VALS(4)
           MOVE 5 TO VALS(5)
           MOVE 9 TO VALS(6)
           MOVE VALS(1) TO PFX(1)
           PERFORM VARYING I FROM 2 BY 1 UNTIL I > 6
               COMPUTE PFX(I) = PFX(I - 1) + VALS(I)
           END-PERFORM
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 6
               DISPLAY "prefix(" I ") = " PFX(I)
           END-PERFORM
           STOP RUN.
