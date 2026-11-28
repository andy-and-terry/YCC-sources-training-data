       IDENTIFICATION DIVISION.
       PROGRAM-ID. STERN.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 SEQ-TABLE.
          05 SEQ    PIC 9(3) OCCURS 15 TIMES.
       01 I         PIC 99.
       01 H         PIC 99.

       PROCEDURE DIVISION.
           MOVE 0 TO SEQ(1)
           MOVE 1 TO SEQ(2)
           PERFORM VARYING I FROM 2 BY 1 UNTIL I > 14
               COMPUTE H = I / 2
               IF FUNCTION MOD(I, 2) = 0
                   MOVE SEQ(H + 1) TO SEQ(I + 1)
               ELSE
                   COMPUTE SEQ(I + 1) = SEQ(H + 1) + SEQ(H + 2)
               END-IF
           END-PERFORM
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 15
               DISPLAY SEQ(I)
           END-PERFORM
           STOP RUN.
