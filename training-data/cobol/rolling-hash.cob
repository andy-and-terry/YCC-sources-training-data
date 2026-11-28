       IDENTIFICATION DIVISION.
       PROGRAM-ID. ROLLING-HASH.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-STR       PIC X(6) VALUE "abcabc".
       01 WS-I         PIC 9(2).
       01 WS-J         PIC 9(2).
       01 WS-H         PIC 9(9).
       01 WS-CODE      PIC 9(3).
       PROCEDURE DIVISION.
           PERFORM VARYING WS-I FROM 1 BY 1 UNTIL WS-I > 4
               MOVE 0 TO WS-H
               PERFORM VARYING WS-J FROM WS-I BY 1
                       UNTIL WS-J > WS-I + 2
                   COMPUTE WS-CODE = FUNCTION ORD(WS-STR(WS-J:1)) - 1
                   COMPUTE WS-H = FUNCTION MOD(WS-H * 31 + WS-CODE,
                                               1000003)
               END-PERFORM
               DISPLAY WS-I " " WS-H
           END-PERFORM
           STOP RUN.
