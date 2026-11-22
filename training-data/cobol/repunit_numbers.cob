       IDENTIFICATION DIVISION.
       PROGRAM-ID. REPUNIT-NUMBERS.
      * Repunits: R_k = (10^k - 1) / 9, built as r = 10r + 1.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-R      PIC 9(9) VALUE 0.
       01 WS-I      PIC 9(2) VALUE 0.
       PROCEDURE DIVISION.
       MAIN-PARA.
           PERFORM VARYING WS-I FROM 1 BY 1 UNTIL WS-I > 8
               COMPUTE WS-R = WS-R * 10 + 1
               DISPLAY WS-R " " WITH NO ADVANCING
           END-PERFORM
           DISPLAY " "
           STOP RUN.
