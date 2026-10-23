       IDENTIFICATION DIVISION.
       PROGRAM-ID. TWOLEVEL.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 SALES-TABLE.
           05 REGION OCCURS 2 TIMES.
              10 QUARTER OCCURS 4 TIMES.
                 15 AMOUNT PIC 9(4) VALUE 0.
       01 R PIC 9.
       01 Q PIC 9.
       01 REGION-TOTAL PIC 9(5).

       PROCEDURE DIVISION.
           PERFORM VARYING R FROM 1 BY 1 UNTIL R > 2
               PERFORM VARYING Q FROM 1 BY 1 UNTIL Q > 4
                   COMPUTE AMOUNT(R, Q) = R * 100 + Q * 10
               END-PERFORM
           END-PERFORM
           PERFORM VARYING R FROM 1 BY 1 UNTIL R > 2
               MOVE 0 TO REGION-TOTAL
               PERFORM VARYING Q FROM 1 BY 1 UNTIL Q > 4
                   ADD AMOUNT(R, Q) TO REGION-TOTAL
               END-PERFORM
               DISPLAY "REGION " R " TOTAL " REGION-TOTAL
           END-PERFORM
           STOP RUN.
