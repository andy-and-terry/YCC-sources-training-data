       IDENTIFICATION DIVISION.
       PROGRAM-ID. SHOELACE-POLYGON-AREA.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-PTS.
          05 WS-PT OCCURS 4 TIMES.
             10 WS-X PIC S9(3).
             10 WS-Y PIC S9(3).
       01 WS-I    PIC 9.
       01 WS-J    PIC 9.
       01 WS-SUM  PIC S9(7) VALUE 0.
       01 WS-AREA PIC 9(5).9.
       PROCEDURE DIVISION.
           MOVE 0 TO WS-X(1) WS-Y(1)
           MOVE 4 TO WS-X(2)
           MOVE 0 TO WS-Y(2)
           MOVE 4 TO WS-X(3)
           MOVE 3 TO WS-Y(3)
           MOVE 0 TO WS-X(4)
           MOVE 3 TO WS-Y(4)
           PERFORM VARYING WS-I FROM 1 BY 1 UNTIL WS-I > 4
               COMPUTE WS-J = FUNCTION MOD(WS-I, 4) + 1
               COMPUTE WS-SUM = WS-SUM + WS-X(WS-I) * WS-Y(WS-J)
                                       - WS-X(WS-J) * WS-Y(WS-I)
           END-PERFORM
           COMPUTE WS-AREA = FUNCTION ABS(WS-SUM) / 2
           DISPLAY WS-AREA
           STOP RUN.
