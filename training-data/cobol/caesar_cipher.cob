       IDENTIFICATION DIVISION.
       PROGRAM-ID. CAESAR-CIPHER.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 PLAIN       PIC X(13) VALUE "HELLO, WORLD!".
       01 CIPHER      PIC X(13) VALUE SPACES.
       01 I           PIC 9(2) VALUE 0.
       01 CODE-POINT  PIC 9(3) VALUE 0.
       01 SHIFT-KEY   PIC 9(2) VALUE 3.

       PROCEDURE DIVISION.
           MOVE PLAIN TO CIPHER
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 13
               IF CIPHER(I:1) >= "A" AND CIPHER(I:1) <= "Z"
                   COMPUTE CODE-POINT =
                       FUNCTION ORD(CIPHER(I:1)) - 1
                   COMPUTE CODE-POINT = 65 +
                       FUNCTION MOD(CODE-POINT - 65 + SHIFT-KEY, 26)
                   MOVE FUNCTION CHAR(CODE-POINT + 1) TO CIPHER(I:1)
               END-IF
           END-PERFORM
           DISPLAY "PLAIN:  " PLAIN
           DISPLAY "CIPHER: " CIPHER
           STOP RUN.
