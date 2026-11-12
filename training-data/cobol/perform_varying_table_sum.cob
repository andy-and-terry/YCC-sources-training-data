       IDENTIFICATION DIVISION.
       PROGRAM-ID. TABSUM.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 T.
          05 V PIC 99 OCCURS 5 TIMES.
       01 I PIC 9.
       01 S PIC 999 VALUE 0.
       PROCEDURE DIVISION.
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 5
               COMPUTE V(I) = I * 2
               ADD V(I) TO S
           END-PERFORM.
           DISPLAY "SUM=" S.
           STOP RUN.
