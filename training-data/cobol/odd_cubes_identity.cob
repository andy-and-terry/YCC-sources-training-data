       IDENTIFICATION DIVISION.
       PROGRAM-ID. ODDCUBES.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 N        PIC 9(2).
       01 I        PIC 9(2).
       01 START-V  PIC 9(4).
       01 TOTAL    PIC 9(6).
       01 CUBE     PIC 9(6).
       PROCEDURE DIVISION.
           PERFORM VARYING N FROM 1 BY 1 UNTIL N > 5
               COMPUTE START-V = N * N - N + 1
               MOVE 0 TO TOTAL
               PERFORM VARYING I FROM 0 BY 1 UNTIL I >= N
                   COMPUTE TOTAL = TOTAL + START-V + 2 * I
               END-PERFORM
               COMPUTE CUBE = N * N * N
               IF TOTAL = CUBE
                   DISPLAY N " " TOTAL " TRUE"
               ELSE
                   DISPLAY N " " TOTAL " FALSE"
               END-IF
           END-PERFORM
           STOP RUN.
