       IDENTIFICATION DIVISION.
       PROGRAM-ID. LCM.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 A PIC 9(9) VALUE 4.
       01 B PIC 9(9) VALUE 6.
       01 X PIC 9(9).
       01 Y PIC 9(9).
       01 TEMP PIC 9(9).
       01 RESULT PIC 9(9).

       PROCEDURE DIVISION.
           MOVE A TO X
           MOVE B TO Y
           PERFORM UNTIL Y = 0
               COMPUTE TEMP = FUNCTION MOD(X, Y)
               MOVE Y TO X
               MOVE TEMP TO Y
           END-PERFORM
           COMPUTE RESULT = A / X * B
           DISPLAY "LCM: " RESULT
           STOP RUN.
