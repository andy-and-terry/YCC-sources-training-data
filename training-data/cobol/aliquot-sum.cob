       IDENTIFICATION DIVISION.
       PROGRAM-ID. ALIQUOT.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 N     PIC 9(4) VALUE 28.
       01 D     PIC 9(4).
       01 TOTAL PIC 9(5) VALUE 0.
       PROCEDURE DIVISION.
           PERFORM VARYING D FROM 1 BY 1 UNTIL D >= N
               IF FUNCTION MOD(N, D) = 0
                   ADD D TO TOTAL
               END-IF
           END-PERFORM
           EVALUATE TRUE
               WHEN TOTAL = N DISPLAY N " " TOTAL " PERFECT"
               WHEN TOTAL > N DISPLAY N " " TOTAL " ABUNDANT"
               WHEN OTHER     DISPLAY N " " TOTAL " DEFICIENT"
           END-EVALUATE
           STOP RUN.
