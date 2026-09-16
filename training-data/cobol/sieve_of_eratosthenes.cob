       IDENTIFICATION DIVISION.
       PROGRAM-ID. SIEVEOFERATOSTHENES.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 LIMIT-VAL PIC 9(3) VALUE 30.
       01 IS-COMPOSITE-TABLE.
           05 IS-COMPOSITE PIC X OCCURS 30 TIMES VALUE "N".
       01 I PIC 9(3).
       01 J PIC 9(3).

       PROCEDURE DIVISION.
           PERFORM VARYING I FROM 2 BY 1 UNTIL I > LIMIT-VAL
               IF IS-COMPOSITE(I) = "N"
                   DISPLAY I
                   PERFORM VARYING J FROM I BY I UNTIL J > LIMIT-VAL
                       IF J > I
                           MOVE "Y" TO IS-COMPOSITE(J)
                       END-IF
                   END-PERFORM
               END-IF
           END-PERFORM
           STOP RUN.
