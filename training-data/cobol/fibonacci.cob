       IDENTIFICATION DIVISION.
       PROGRAM-ID. FIBONACCI.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 N           PIC 9(2) VALUE 10.
       01 I           PIC 9(2) VALUE 0.
       01 A           PIC 9(9) VALUE 0.
       01 B           PIC 9(9) VALUE 1.
       01 TEMP        PIC 9(9) VALUE 0.

       PROCEDURE DIVISION.
           PERFORM VARYING I FROM 0 BY 1 UNTIL I > N
               DISPLAY A
               COMPUTE TEMP = A + B
               MOVE B TO A
               MOVE TEMP TO B
           END-PERFORM
           STOP RUN.
