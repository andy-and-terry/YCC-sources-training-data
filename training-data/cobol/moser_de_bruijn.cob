       IDENTIFICATION DIVISION.
       PROGRAM-ID. MOSER.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 I        PIC 99.
       01 X        PIC 99.
       01 VALUE-OUT PIC 9(4).
       01 POWER    PIC 9(4).
       PROCEDURE DIVISION.
           PERFORM VARYING I FROM 0 BY 1 UNTIL I > 9
               MOVE I TO X
               MOVE 0 TO VALUE-OUT
               MOVE 1 TO POWER
               PERFORM UNTIL X = 0
                   IF FUNCTION MOD(X, 2) = 1
                       ADD POWER TO VALUE-OUT
                   END-IF
                   COMPUTE POWER = POWER * 4
                   COMPUTE X = X / 2
               END-PERFORM
               DISPLAY VALUE-OUT
           END-PERFORM
           STOP RUN.
      * Prints 0000 0001 0004 0005 0016 0017 0020 0021 0064 0065
