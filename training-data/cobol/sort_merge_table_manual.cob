       IDENTIFICATION DIVISION.
       PROGRAM-ID. SORTER.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 NUMS.
          05 NUM PIC 99 OCCURS 6 TIMES.
       01 I PIC 9.
       01 J PIC 9.
       01 TMP PIC 99.
       01 LIMIT-J PIC 9.
       PROCEDURE DIVISION.
           MOVE 42 TO NUM(1) MOVE 7 TO NUM(2) MOVE 19 TO NUM(3)
           MOVE 88 TO NUM(4) MOVE 3 TO NUM(5) MOVE 56 TO NUM(6)
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 5
               COMPUTE LIMIT-J = 6 - I
               PERFORM VARYING J FROM 1 BY 1 UNTIL J > LIMIT-J
                   IF NUM(J) > NUM(J + 1)
                       MOVE NUM(J) TO TMP
                       MOVE NUM(J + 1) TO NUM(J)
                       MOVE TMP TO NUM(J + 1)
                   END-IF
               END-PERFORM
           END-PERFORM
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 6
               DISPLAY NUM(I) WITH NO ADVANCING
               DISPLAY " " WITH NO ADVANCING
           END-PERFORM
           DISPLAY SPACE
           STOP RUN.
