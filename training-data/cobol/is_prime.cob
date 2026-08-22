       IDENTIFICATION DIVISION.
       PROGRAM-ID. ISPRIME.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 N           PIC 9(3) VALUE 2.
       01 DIVISOR     PIC 9(3).
       01 IS-PRIME    PIC X VALUE "Y".

       PROCEDURE DIVISION.
           PERFORM VARYING N FROM 2 BY 1 UNTIL N > 20
               MOVE "Y" TO IS-PRIME
               PERFORM VARYING DIVISOR FROM 2 BY 1
                   UNTIL DIVISOR * DIVISOR > N
                   IF FUNCTION MOD(N, DIVISOR) = 0
                       MOVE "N" TO IS-PRIME
                   END-IF
               END-PERFORM
               IF IS-PRIME = "Y"
                   DISPLAY N
               END-IF
           END-PERFORM
           STOP RUN.
