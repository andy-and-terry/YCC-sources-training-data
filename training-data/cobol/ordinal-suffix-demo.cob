       IDENTIFICATION DIVISION.
       PROGRAM-ID. ORDINAL-SUFFIX-DEMO.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-N        PIC 9(4).
       01 WS-R100     PIC 9(3).
       01 WS-R10      PIC 9(2).
       01 WS-SUFFIX   PIC XX.
       01 WS-EDIT     PIC Z(3)9.
       PROCEDURE DIVISION.
       MAIN-PARA.
           PERFORM VARYING WS-N FROM 1 BY 1 UNTIL WS-N > 24
               COMPUTE WS-R100 = FUNCTION MOD(WS-N, 100)
               COMPUTE WS-R10  = FUNCTION MOD(WS-N, 10)
               EVALUATE TRUE
                   WHEN WS-R100 >= 11 AND WS-R100 <= 13
                       MOVE "TH" TO WS-SUFFIX
                   WHEN WS-R10 = 1
                       MOVE "ST" TO WS-SUFFIX
                   WHEN WS-R10 = 2
                       MOVE "ND" TO WS-SUFFIX
                   WHEN WS-R10 = 3
                       MOVE "RD" TO WS-SUFFIX
                   WHEN OTHER
                       MOVE "TH" TO WS-SUFFIX
               END-EVALUATE
               MOVE WS-N TO WS-EDIT
               DISPLAY WS-EDIT WS-SUFFIX
           END-PERFORM
           STOP RUN.
