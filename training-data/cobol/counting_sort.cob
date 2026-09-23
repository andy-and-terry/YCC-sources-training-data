       IDENTIFICATION DIVISION.
       PROGRAM-ID. COUNTINGSORT.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 ARR.
           05 ARR-ITEM PIC 9(2) OCCURS 8 TIMES.
       01 COUNT-TABLE.
           05 COUNT-ENTRY PIC 9(2) OCCURS 21 TIMES VALUE 0.
       01 I PIC 9(2).
       01 J PIC 9(2).
       01 OUT-POS PIC 9(2) VALUE 1.
       01 BUCKET-INDEX PIC 9(2).

       PROCEDURE DIVISION.
           MOVE 5 TO ARR-ITEM(1)
           MOVE 2 TO ARR-ITEM(2)
           MOVE 18 TO ARR-ITEM(3)
           MOVE 9 TO ARR-ITEM(4)
           MOVE 2 TO ARR-ITEM(5)
           MOVE 15 TO ARR-ITEM(6)
           MOVE 9 TO ARR-ITEM(7)
           MOVE 0 TO ARR-ITEM(8)

           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 8
               COMPUTE BUCKET-INDEX = ARR-ITEM(I) + 1
               ADD 1 TO COUNT-ENTRY(BUCKET-INDEX)
           END-PERFORM

           PERFORM VARYING J FROM 1 BY 1 UNTIL J > 21
               PERFORM UNTIL COUNT-ENTRY(J) = 0
                   COMPUTE ARR-ITEM(OUT-POS) = J - 1
                   ADD 1 TO OUT-POS
                   SUBTRACT 1 FROM COUNT-ENTRY(J)
               END-PERFORM
           END-PERFORM

           DISPLAY "SORTED:"
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 8
               DISPLAY ARR-ITEM(I)
           END-PERFORM
           STOP RUN.
