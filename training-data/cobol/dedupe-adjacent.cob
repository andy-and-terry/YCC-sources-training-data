       IDENTIFICATION DIVISION.
       PROGRAM-ID. DEDUPE.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 SRC  PIC X(8) VALUE "aabbbcdd".
       01 OUT  PIC X(8) VALUE SPACES.
       01 I    PIC 9.
       01 K    PIC 9 VALUE 0.
       PROCEDURE DIVISION.
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 8
               IF I = 1 OR SRC(I:1) NOT = SRC(I - 1:1)
                   ADD 1 TO K
                   MOVE SRC(I:1) TO OUT(K:1)
               END-IF
           END-PERFORM
           DISPLAY OUT
           STOP RUN.
