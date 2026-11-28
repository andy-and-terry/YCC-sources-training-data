       IDENTIFICATION DIVISION.
       PROGRAM-ID. SIERPINSKI.
      * Pascal's triangle mod 2 yields the Sierpinski pattern.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-ROW.
          05 WS-V     PIC 9 OCCURS 8 TIMES VALUE 0.
       01 WS-R        PIC 9(2).
       01 WS-C        PIC 9(2).
       01 WS-LINE     PIC X(24).
       01 WS-POS      PIC 9(2).
       PROCEDURE DIVISION.
           MOVE 1 TO WS-V(1)
           PERFORM VARYING WS-R FROM 1 BY 1 UNTIL WS-R > 8
               MOVE SPACES TO WS-LINE
               PERFORM VARYING WS-C FROM 1 BY 1 UNTIL WS-C > WS-R
                   COMPUTE WS-POS = (8 - WS-R) + (WS-C - 1) * 2 + 1
                   IF WS-V(WS-C) = 1
                       MOVE "*" TO WS-LINE(WS-POS:1)
                   END-IF
               END-PERFORM
               DISPLAY WS-LINE
      *        next row: v(c) = (v(c) + v(c-1)) mod 2, right to left
               PERFORM VARYING WS-C FROM 8 BY -1 UNTIL WS-C < 2
                   COMPUTE WS-V(WS-C) =
                       FUNCTION MOD(WS-V(WS-C) + WS-V(WS-C - 1), 2)
               END-PERFORM
           END-PERFORM
           STOP RUN.
