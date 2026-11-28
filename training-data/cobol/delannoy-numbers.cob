       IDENTIFICATION DIVISION.
       PROGRAM-ID. DELANNOY-NUMBERS.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-TABLE.
          05 WS-ROW OCCURS 8 TIMES.
             10 WS-D PIC 9(6) OCCURS 8 TIMES.
       01 I PIC 99.
       01 J PIC 99.
       PROCEDURE DIVISION.
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 8
               PERFORM VARYING J FROM 1 BY 1 UNTIL J > 8
                   IF I = 1 OR J = 1
                       MOVE 1 TO WS-D(I, J)
                   ELSE
                       COMPUTE WS-D(I, J) = WS-D(I - 1, J)
                           + WS-D(I, J - 1) + WS-D(I - 1, J - 1)
                   END-IF
               END-PERFORM
               DISPLAY WS-D(I, I)
           END-PERFORM
           STOP RUN.
