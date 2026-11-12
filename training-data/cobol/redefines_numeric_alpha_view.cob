       IDENTIFICATION DIVISION.
       PROGRAM-ID. REDEF.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 D PIC 9(8) VALUE 20240315.
       01 DP REDEFINES D.
          05 Y PIC 9(4).
          05 M PIC 99.
          05 DD PIC 99.
       PROCEDURE DIVISION.
           DISPLAY Y "/" M "/" DD.
           STOP RUN.
