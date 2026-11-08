       IDENTIFICATION DIVISION.
       PROGRAM-ID. SHOELACE.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 SUM-V  PIC S9(5) VALUE 0.
       01 AREA-V PIC 9(5)V9.
       PROCEDURE DIVISION.
      *    Rectangle (0,0) (4,0) (4,3) (0,3)
           COMPUTE SUM-V = (0 * 0 - 4 * 0) + (4 * 3 - 4 * 0)
                         + (4 * 3 - 0 * 3) + (0 * 0 - 0 * 3)
           COMPUTE AREA-V = FUNCTION ABS(SUM-V) / 2
           DISPLAY "AREA: " AREA-V
           STOP RUN.
