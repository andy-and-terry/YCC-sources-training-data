       IDENTIFICATION DIVISION.
       PROGRAM-ID. PERFECT-TOTIENT-NUMBERS.
      * Perfect totient numbers: sum of the iterated totient chain
      * down to 1 equals n.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-N      PIC 9(3) VALUE 0.
       01 WS-M      PIC 9(3) VALUE 0.
       01 WS-K      PIC 9(3) VALUE 0.
       01 WS-PHI    PIC 9(3) VALUE 0.
       01 WS-TOTAL  PIC 9(5) VALUE 0.
       01 WS-OUT    PIC Z(2)9.
       PROCEDURE DIVISION.
       MAIN-PARA.
           PERFORM VARYING WS-N FROM 2 BY 1 UNTIL WS-N > 199
               MOVE WS-N TO WS-M
               MOVE 0 TO WS-TOTAL
               PERFORM UNTIL WS-M <= 1
                   PERFORM COMPUTE-PHI
                   MOVE WS-PHI TO WS-M
                   ADD WS-PHI TO WS-TOTAL
               END-PERFORM
               IF WS-TOTAL = WS-N
                   MOVE WS-N TO WS-OUT
                   DISPLAY WS-OUT WITH NO ADVANCING
               END-IF
           END-PERFORM
           DISPLAY " "
           STOP RUN.
       COMPUTE-PHI.
           MOVE 0 TO WS-PHI
           PERFORM VARYING WS-K FROM 1 BY 1 UNTIL WS-K > WS-M
               IF FUNCTION GCD (WS-K, WS-M) = 1
                   ADD 1 TO WS-PHI
               END-IF
           END-PERFORM.
