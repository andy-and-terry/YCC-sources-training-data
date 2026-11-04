       IDENTIFICATION DIVISION.
       PROGRAM-ID. REVERSE-TABLE-DEMO.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-TABLE.
          05 WS-ITEM PIC 9(2) OCCURS 6 TIMES.
       01 WS-I    PIC 9.
       01 WS-J    PIC 9.
       01 WS-TMP  PIC 9(2).
       PROCEDURE DIVISION.
       MAIN-PARA.
           PERFORM VARYING WS-I FROM 1 BY 1 UNTIL WS-I > 6
               COMPUTE WS-ITEM(WS-I) = WS-I * 10
           END-PERFORM
           MOVE 1 TO WS-I
           MOVE 6 TO WS-J
           PERFORM UNTIL WS-I >= WS-J
               MOVE WS-ITEM(WS-I) TO WS-TMP
               MOVE WS-ITEM(WS-J) TO WS-ITEM(WS-I)
               MOVE WS-TMP        TO WS-ITEM(WS-J)
               ADD 1 TO WS-I
               SUBTRACT 1 FROM WS-J
           END-PERFORM
           PERFORM VARYING WS-I FROM 1 BY 1 UNTIL WS-I > 6
               DISPLAY WS-ITEM(WS-I)
           END-PERFORM
           STOP RUN.
