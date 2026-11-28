       IDENTIFICATION DIVISION.
       PROGRAM-ID. BITREV.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 VALUE-IN   PIC 9(3) VALUE 13.
       01 V          PIC 9(3).
       01 R          PIC 9(3) VALUE 0.
       01 I          PIC 9.

       PROCEDURE DIVISION.
           MOVE VALUE-IN TO V
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 8
               COMPUTE R = R * 2 + FUNCTION MOD(V, 2)
               COMPUTE V = V / 2
           END-PERFORM
           DISPLAY VALUE-IN " -> " R
           STOP RUN.
