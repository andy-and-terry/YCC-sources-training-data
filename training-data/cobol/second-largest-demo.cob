       IDENTIFICATION DIVISION.
       PROGRAM-ID. SECOND-LARGEST-DEMO.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-VALUES.
          05 WS-V PIC S9(4) OCCURS 5 TIMES.
       01 WS-FIRST   PIC S9(4) VALUE -9999.
       01 WS-SECOND  PIC S9(4) VALUE -9999.
       01 WS-I       PIC 9.
       PROCEDURE DIVISION.
       MAIN-PARA.
           MOVE 4 TO WS-V(1)
           MOVE 9 TO WS-V(2)
           MOVE 2 TO WS-V(3)
           MOVE 9 TO WS-V(4)
           MOVE 7 TO WS-V(5)
           PERFORM VARYING WS-I FROM 1 BY 1 UNTIL WS-I > 5
               IF WS-V(WS-I) > WS-FIRST
                   MOVE WS-FIRST TO WS-SECOND
                   MOVE WS-V(WS-I) TO WS-FIRST
               ELSE
                   IF WS-V(WS-I) > WS-SECOND AND
                      WS-V(WS-I) NOT = WS-FIRST
                       MOVE WS-V(WS-I) TO WS-SECOND
                   END-IF
               END-IF
           END-PERFORM
           DISPLAY "SECOND LARGEST = " WS-SECOND
           STOP RUN.
