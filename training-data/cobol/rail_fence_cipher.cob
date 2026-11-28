       IDENTIFICATION DIVISION.
       PROGRAM-ID. RAILFENCE.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 TEXT-IN  PIC X(15) VALUE "WEAREDISCOVERED".
       01 TEXT-OUT PIC X(15) VALUE SPACES.
       01 K        PIC 9 VALUE 3.
       01 CYC      PIC 9 VALUE 4.
       01 RAIL     PIC 9.
       01 R        PIC 9.
       01 I        PIC 99.
       01 OUT-POS  PIC 99 VALUE 1.

       PROCEDURE DIVISION.
           PERFORM VARYING R FROM 0 BY 1 UNTIL R >= K
               PERFORM VARYING I FROM 0 BY 1 UNTIL I >= 15
                   COMPUTE RAIL = FUNCTION MOD(I, CYC)
                   IF RAIL >= K
                       COMPUTE RAIL = CYC - RAIL
                   END-IF
                   IF RAIL = R
                       MOVE TEXT-IN (I + 1:1) TO TEXT-OUT (OUT-POS:1)
                       ADD 1 TO OUT-POS
                   END-IF
               END-PERFORM
           END-PERFORM
           DISPLAY TEXT-OUT
           STOP RUN.
