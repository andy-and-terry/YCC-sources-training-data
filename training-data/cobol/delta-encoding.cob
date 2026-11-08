       IDENTIFICATION DIVISION.
       PROGRAM-ID. DELTAENC.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 XS-TABLE.
          05 X PIC S9(3) OCCURS 5 TIMES VALUES 10 12 15 15 20.
       01 D-TABLE.
          05 D PIC S9(3) OCCURS 5 TIMES.
       01 I PIC 9.
       PROCEDURE DIVISION.
           MOVE X(1) TO D(1)
           PERFORM VARYING I FROM 2 BY 1 UNTIL I > 5
               COMPUTE D(I) = X(I) - X(I - 1)
           END-PERFORM
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 5
               DISPLAY "D(" I ") = " D(I)
           END-PERFORM
           STOP RUN.
