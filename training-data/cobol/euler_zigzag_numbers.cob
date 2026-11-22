       IDENTIFICATION DIVISION.
       PROGRAM-ID. EULER-ZIGZAG-NUMBERS.
      * Euler zigzag numbers via the Seidel-Entringer boustrophedon.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-ROW.
          05 WS-R    PIC 9(9) OCCURS 16 TIMES VALUE 0.
       01 WS-NXT.
          05 WS-X    PIC 9(9) OCCURS 16 TIMES VALUE 0.
       01 WS-LEN    PIC 9(2) VALUE 1.
       01 WS-I      PIC 9(2) VALUE 0.
       01 WS-J      PIC 9(2) VALUE 0.
       01 WS-IDX    PIC 9(2) VALUE 0.
       PROCEDURE DIVISION.
       MAIN-PARA.
           MOVE 1 TO WS-R(1)
           DISPLAY WS-R(1) " " WITH NO ADVANCING
           PERFORM VARYING WS-I FROM 1 BY 1 UNTIL WS-I > 9
               MOVE 0 TO WS-X(1)
               PERFORM VARYING WS-J FROM 1 BY 1 UNTIL WS-J > WS-LEN
                   COMPUTE WS-IDX = WS-LEN - WS-J + 1
                   COMPUTE WS-X(WS-J + 1) = WS-X(WS-J) + WS-R(WS-IDX)
               END-PERFORM
               ADD 1 TO WS-LEN
               PERFORM VARYING WS-J FROM 1 BY 1 UNTIL WS-J > WS-LEN
                   MOVE WS-X(WS-J) TO WS-R(WS-J)
               END-PERFORM
               DISPLAY WS-R(WS-LEN) " " WITH NO ADVANCING
           END-PERFORM
           DISPLAY " "
           STOP RUN.
