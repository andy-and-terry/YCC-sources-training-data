       IDENTIFICATION DIVISION.
       PROGRAM-ID. MATRIXTRANSPOSE.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 SOURCE-MATRIX.
           05 SRC-ROW OCCURS 2 TIMES.
               10 SRC-CELL PIC 9(2) OCCURS 3 TIMES.
       01 TRANSPOSED-MATRIX.
           05 TRN-ROW OCCURS 3 TIMES.
               10 TRN-CELL PIC 9(2) OCCURS 2 TIMES.
       01 R PIC 9(1).
       01 C PIC 9(1).

       PROCEDURE DIVISION.
           MOVE 1 TO SRC-CELL(1, 1)
           MOVE 2 TO SRC-CELL(1, 2)
           MOVE 3 TO SRC-CELL(1, 3)
           MOVE 4 TO SRC-CELL(2, 1)
           MOVE 5 TO SRC-CELL(2, 2)
           MOVE 6 TO SRC-CELL(2, 3)

           PERFORM VARYING R FROM 1 BY 1 UNTIL R > 2
               PERFORM VARYING C FROM 1 BY 1 UNTIL C > 3
                   MOVE SRC-CELL(R, C) TO TRN-CELL(C, R)
               END-PERFORM
           END-PERFORM

           PERFORM VARYING R FROM 1 BY 1 UNTIL R > 3
               DISPLAY TRN-CELL(R, 1) " " TRN-CELL(R, 2)
           END-PERFORM
           STOP RUN.
