       IDENTIFICATION DIVISION.
       PROGRAM-ID. VALIDPARENS.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 SOURCE-STR PIC X(6) VALUE "([{}])".
       01 STACK-ARR PIC X(6).
       01 TOP PIC 9(2) VALUE 0.
       01 I PIC 9(2).
       01 CH PIC X.
       01 VALID PIC X VALUE "Y".

       PROCEDURE DIVISION.
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 6
               MOVE SOURCE-STR(I:1) TO CH
               EVALUATE CH
                   WHEN "(" WHEN "[" WHEN "{"
                       ADD 1 TO TOP
                       MOVE CH TO STACK-ARR(TOP:1)
                   WHEN ")"
                       IF TOP = 0 OR STACK-ARR(TOP:1) NOT = "("
                           MOVE "N" TO VALID
                       ELSE
                           SUBTRACT 1 FROM TOP
                       END-IF
                   WHEN "]"
                       IF TOP = 0 OR STACK-ARR(TOP:1) NOT = "["
                           MOVE "N" TO VALID
                       ELSE
                           SUBTRACT 1 FROM TOP
                       END-IF
                   WHEN "}"
                       IF TOP = 0 OR STACK-ARR(TOP:1) NOT = "{"
                           MOVE "N" TO VALID
                       ELSE
                           SUBTRACT 1 FROM TOP
                       END-IF
               END-EVALUATE
           END-PERFORM
           IF TOP NOT = 0
               MOVE "N" TO VALID
           END-IF
           DISPLAY "VALID: " VALID
           STOP RUN.
