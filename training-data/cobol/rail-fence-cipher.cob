       IDENTIFICATION DIVISION.
       PROGRAM-ID. RAIL-FENCE-CIPHER.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-TEXT   PIC X(15) VALUE "WEAREDISCOVERED".
       01 WS-OUT    PIC X(15).
       01 WS-I      PIC 99.
       01 WS-ROW    PIC 9.
       01 WS-R      PIC S9.
       01 WS-STEP   PIC S9.
       01 WS-K      PIC 99 VALUE 1.
       PROCEDURE DIVISION.
           PERFORM VARYING WS-ROW FROM 0 BY 1 UNTIL WS-ROW > 2
               MOVE 0 TO WS-R
               MOVE 1 TO WS-STEP
               PERFORM VARYING WS-I FROM 1 BY 1 UNTIL WS-I > 15
                   IF WS-R = WS-ROW
                       MOVE WS-TEXT(WS-I:1) TO WS-OUT(WS-K:1)
                       ADD 1 TO WS-K
                   END-IF
                   IF WS-R = 0 MOVE 1 TO WS-STEP END-IF
                   IF WS-R = 2 MOVE -1 TO WS-STEP END-IF
                   ADD WS-STEP TO WS-R
               END-PERFORM
           END-PERFORM
           DISPLAY WS-OUT
           STOP RUN.
