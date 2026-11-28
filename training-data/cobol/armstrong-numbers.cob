       IDENTIFICATION DIVISION.
       PROGRAM-ID. ARMSTRONG.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 N        PIC 9(4).
       01 M        PIC 9(4).
       01 D        PIC 9.
       01 LEN      PIC 9.
       01 TOTAL    PIC 9(6).

       PROCEDURE DIVISION.
           PERFORM VARYING N FROM 1 BY 1 UNTIL N > 999
               COMPUTE LEN = FUNCTION LENGTH(FUNCTION TRIM(N))
               IF N < 10 MOVE 1 TO LEN
               ELSE IF N < 100 MOVE 2 TO LEN
               ELSE MOVE 3 TO LEN
               END-IF END-IF
               MOVE 0 TO TOTAL
               MOVE N TO M
               PERFORM UNTIL M = 0
                   COMPUTE D = FUNCTION MOD(M, 10)
                   COMPUTE TOTAL = TOTAL + D ** LEN
                   COMPUTE M = M / 10
               END-PERFORM
               IF TOTAL = N
                   DISPLAY N
               END-IF
           END-PERFORM
           STOP RUN.
