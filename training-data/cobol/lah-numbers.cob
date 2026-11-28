       IDENTIFICATION DIVISION.
       PROGRAM-ID. LAH-NUMBERS.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-N   PIC 9.
       01 WS-K   PIC 9.
       01 WS-I   PIC 99.
       01 WS-C   PIC 9(9).
       01 WS-F   PIC 9(9).
       01 WS-OUT PIC Z(8)9.
       PROCEDURE DIVISION.
           PERFORM VARYING WS-N FROM 1 BY 1 UNTIL WS-N > 5
               PERFORM VARYING WS-K FROM 1 BY 1 UNTIL WS-K > WS-N
                   MOVE 1 TO WS-C WS-F
                   PERFORM VARYING WS-I FROM 0 BY 1 UNTIL WS-I > WS-K - 2
                       COMPUTE WS-C = WS-C * (WS-N - 1 - WS-I) / (WS-I + 1)
                   END-PERFORM
                   PERFORM VARYING WS-I FROM WS-K BY 1 UNTIL WS-I >= WS-N
                       COMPUTE WS-F = WS-F * (WS-I + 1)
                   END-PERFORM
                   COMPUTE WS-OUT = WS-C * WS-F
                   DISPLAY WS-OUT WITH NO ADVANCING
               END-PERFORM
               DISPLAY " "
           END-PERFORM
           STOP RUN.
