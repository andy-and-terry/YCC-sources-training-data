       IDENTIFICATION DIVISION.
       PROGRAM-ID. ARITH.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 A       PIC S9(5)V99 VALUE 1234.56.
       01 B       PIC S9(5)V99 VALUE -78.90.
       01 R       PIC S9(7)V99.
       01 Q       PIC 9(4).
       01 REM     PIC 9(4).
       01 PCT     PIC 9(3)V9 VALUE 0.
       01 ERR     PIC X VALUE "N".
       PROCEDURE DIVISION.
           ADD A TO B GIVING R
           DISPLAY "sum " R
           MULTIPLY A BY 2 GIVING R ROUNDED
           DISPLAY "double " R
           COMPUTE R ROUNDED = (A * 3) / 7 + B ** 2
           DISPLAY "expr " R
           DIVIDE 17 BY 5 GIVING Q REMAINDER REM
           DISPLAY Q " r " REM
           COMPUTE PCT ROUNDED = 7 / 9 * 100
           DISPLAY PCT "%"
           SUBTRACT 1 FROM Q
           COMPUTE Q = 10 / 0
               ON SIZE ERROR MOVE "Y" TO ERR
           END-COMPUTE
           DISPLAY "size error: " ERR
           DISPLAY FUNCTION ABS(B) " " FUNCTION MAX(3, 9, 4) " " FUNCTION MOD(17, 5) " " FUNCTION SQRT(144)
           STOP RUN.
