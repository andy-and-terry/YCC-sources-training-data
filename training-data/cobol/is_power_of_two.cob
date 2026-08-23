       IDENTIFICATION DIVISION.
       PROGRAM-ID. ISPOWEROFTWO.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 N PIC 9(9) VALUE 16.
       01 M PIC 9(9).
       01 IS-POWER PIC X VALUE "Y".

       PROCEDURE DIVISION.
           MOVE N TO M
           IF M = 0
               MOVE "N" TO IS-POWER
           ELSE
               PERFORM UNTIL M = 1
                   IF FUNCTION MOD(M, 2) NOT = 0
                       MOVE "N" TO IS-POWER
                       MOVE 1 TO M
                   ELSE
                       DIVIDE M BY 2 GIVING M
                   END-IF
               END-PERFORM
           END-IF
           DISPLAY "POWER OF TWO: " IS-POWER
           STOP RUN.
