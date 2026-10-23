       IDENTIFICATION DIVISION.
       PROGRAM-ID. EXITPERFORM.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 I          PIC 9(3).
       01 TOTAL      PIC 9(5) VALUE 0.
       01 FOUND      PIC 9(3) VALUE 0.

       PROCEDURE DIVISION.
      * EXIT PERFORM CYCLE skips the rest of the loop body (like
      * "continue"); EXIT PERFORM leaves the loop (like "break").
      * Both require an inline PERFORM.
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 20
               IF FUNCTION MOD(I, 3) = 0
                   EXIT PERFORM CYCLE
               END-IF
               ADD I TO TOTAL
           END-PERFORM
           DISPLAY "SUM OF NON-MULTIPLES OF 3 UP TO 20: " TOTAL

           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 100
               IF I * I > 200
                   MOVE I TO FOUND
                   EXIT PERFORM
               END-IF
           END-PERFORM
           DISPLAY "FIRST I WITH I*I > 200: " FOUND
           STOP RUN.
