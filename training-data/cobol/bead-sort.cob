       IDENTIFICATION DIVISION.
       PROGRAM-ID. BEADSORT.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 NUMS.
          05 NUM PIC 9 OCCURS 5 TIMES.
       01 COLS.
          05 COL PIC 9 OCCURS 5 TIMES.
       01 R PIC 9.
       01 I PIC 9.
       01 C PIC 9.
       PROCEDURE DIVISION.
           MOVE 5 TO NUM(1) MOVE 3 TO NUM(2) MOVE 1 TO NUM(3)
           MOVE 4 TO NUM(4) MOVE 2 TO NUM(5)
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 5
               MOVE 0 TO COL(I)
               PERFORM VARYING R FROM 1 BY 1 UNTIL R > 5
                   IF NUM(R) >= I ADD 1 TO COL(I) END-IF
               END-PERFORM
           END-PERFORM
           PERFORM VARYING R FROM 1 BY 1 UNTIL R > 5
               MOVE 0 TO C
               PERFORM VARYING I FROM 1 BY 1 UNTIL I > 5
                   IF COL(I) >= 6 - R ADD 1 TO C END-IF
               END-PERFORM
               DISPLAY C
           END-PERFORM
           STOP RUN.
