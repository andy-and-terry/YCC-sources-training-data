       IDENTIFICATION DIVISION.
       PROGRAM-ID. STACKOPS.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 STACK-ARR.
           05 STACK-CELL PIC 9(3) OCCURS 10 TIMES.
       01 STACK-TOP PIC 9(2) VALUE 0.
       01 POPPED-VAL PIC 9(3).
       01 IS-EMPTY PIC X VALUE "Y".

       PROCEDURE DIVISION.
           MOVE 10 TO POPPED-VAL
           PERFORM PUSH-VALUE
           MOVE 20 TO POPPED-VAL
           PERFORM PUSH-VALUE
           MOVE 30 TO POPPED-VAL
           PERFORM PUSH-VALUE

           PERFORM POP-VALUE
           DISPLAY "POPPED: " POPPED-VAL

           PERFORM PUSH-VALUE
           PERFORM POP-VALUE
           DISPLAY "POPPED: " POPPED-VAL
           PERFORM POP-VALUE
           DISPLAY "POPPED: " POPPED-VAL
           PERFORM POP-VALUE
           DISPLAY "POPPED: " POPPED-VAL

           PERFORM POP-VALUE
           IF IS-EMPTY = "Y"
               DISPLAY "STACK IS EMPTY"
           END-IF
           STOP RUN.

       PUSH-VALUE.
           IF STACK-TOP < 10
               ADD 1 TO STACK-TOP
               MOVE POPPED-VAL TO STACK-CELL(STACK-TOP)
           END-IF.

       POP-VALUE.
           IF STACK-TOP = 0
               MOVE "Y" TO IS-EMPTY
           ELSE
               MOVE "N" TO IS-EMPTY
               MOVE STACK-CELL(STACK-TOP) TO POPPED-VAL
               SUBTRACT 1 FROM STACK-TOP
           END-IF.
