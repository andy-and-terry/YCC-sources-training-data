       IDENTIFICATION DIVISION.
       PROGRAM-ID. FLOW.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 N         PIC 99 VALUE 0.
       01 ACC       PIC 9(4) VALUE 0.
       PROCEDURE DIVISION.
       MAIN-PARA.
           PERFORM INIT-PARA
           PERFORM LOOP-PARA 5 TIMES
           PERFORM SHOW-A THRU SHOW-C
           PERFORM UNTIL N > 8
               ADD 3 TO N
           END-PERFORM
           DISPLAY "N=" N " ACC=" ACC
           PERFORM WITH TEST AFTER VARYING N FROM 1 BY 2 UNTIL N > 5
               DISPLAY "n=" N
           END-PERFORM
           STOP RUN.
       INIT-PARA.
           MOVE 0 TO N ACC.
       LOOP-PARA.
           ADD 1 TO N
           ADD N TO ACC.
       SHOW-A.
           DISPLAY "A".
       SHOW-B.
           DISPLAY "B".
       SHOW-C.
           DISPLAY "C".
