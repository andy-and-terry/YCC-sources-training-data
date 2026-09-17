       IDENTIFICATION DIVISION.
       PROGRAM-ID. ROMANNUMERALS.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 VALUE-TABLE.
           05 VAL-CELL PIC 9(4) OCCURS 13 TIMES.
       01 SYMBOL-TABLE.
           05 SYM-CELL PIC X(2) OCCURS 13 TIMES.
       01 NUMBER PIC 9(4) VALUE 1994.
       01 RESULT PIC X(20) VALUE SPACES.
       01 RESULT-LEN PIC 9(2) VALUE 1.
       01 I PIC 9(2).
       01 SYM-LEN PIC 9(1).

       PROCEDURE DIVISION.
           MOVE 1000 TO VAL-CELL(1)
           MOVE "M " TO SYM-CELL(1)
           MOVE 900 TO VAL-CELL(2)
           MOVE "CM" TO SYM-CELL(2)
           MOVE 500 TO VAL-CELL(3)
           MOVE "D " TO SYM-CELL(3)
           MOVE 400 TO VAL-CELL(4)
           MOVE "CD" TO SYM-CELL(4)
           MOVE 100 TO VAL-CELL(5)
           MOVE "C " TO SYM-CELL(5)
           MOVE 90 TO VAL-CELL(6)
           MOVE "XC" TO SYM-CELL(6)
           MOVE 50 TO VAL-CELL(7)
           MOVE "L " TO SYM-CELL(7)
           MOVE 40 TO VAL-CELL(8)
           MOVE "XL" TO SYM-CELL(8)
           MOVE 10 TO VAL-CELL(9)
           MOVE "X " TO SYM-CELL(9)
           MOVE 9 TO VAL-CELL(10)
           MOVE "IX" TO SYM-CELL(10)
           MOVE 5 TO VAL-CELL(11)
           MOVE "V " TO SYM-CELL(11)
           MOVE 4 TO VAL-CELL(12)
           MOVE "IV" TO SYM-CELL(12)
           MOVE 1 TO VAL-CELL(13)
           MOVE "I " TO SYM-CELL(13)

           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 13
               PERFORM UNTIL NUMBER < VAL-CELL(I)
                   IF SYM-CELL(I)(2:1) = " "
                       MOVE 1 TO SYM-LEN
                   ELSE
                       MOVE 2 TO SYM-LEN
                   END-IF
                   STRING SYM-CELL(I)(1:SYM-LEN) DELIMITED BY SIZE
                       INTO RESULT
                       WITH POINTER RESULT-LEN
                   END-STRING
                   SUBTRACT VAL-CELL(I) FROM NUMBER
               END-PERFORM
           END-PERFORM

           DISPLAY "ROMAN: " RESULT
           STOP RUN.
