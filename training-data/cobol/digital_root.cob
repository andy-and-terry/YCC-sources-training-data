       IDENTIFICATION DIVISION.
       PROGRAM-ID. DIGITAL-ROOT.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 N           PIC 9(9) VALUE 9875.
       01 DIGIT-SUM   PIC 9(9) VALUE 0.
       01 WORK-N      PIC 9(9) VALUE 0.

       PROCEDURE DIVISION.
           PERFORM UNTIL N < 10
               MOVE 0 TO DIGIT-SUM
               MOVE N TO WORK-N
               PERFORM UNTIL WORK-N = 0
                   ADD FUNCTION MOD(WORK-N, 10) TO DIGIT-SUM
                   DIVIDE 10 INTO WORK-N
               END-PERFORM
               MOVE DIGIT-SUM TO N
           END-PERFORM
           DISPLAY "DIGITAL ROOT: " N
           STOP RUN.
