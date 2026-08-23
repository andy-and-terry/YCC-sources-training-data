       IDENTIFICATION DIVISION.
       PROGRAM-ID. MULTTABLE.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 I PIC 9(2).
       01 J PIC 9(2).
       01 PRODUCT PIC 9(3).

       PROCEDURE DIVISION.
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 5
               PERFORM VARYING J FROM 1 BY 1 UNTIL J > 5
                   COMPUTE PRODUCT = I * J
                   DISPLAY PRODUCT
               END-PERFORM
           END-PERFORM
           STOP RUN.
