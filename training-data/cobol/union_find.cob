       IDENTIFICATION DIVISION.
       PROGRAM-ID. UNIONFIND.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 NUM-NODES PIC 9(1) VALUE 6.
       01 PARENT-ARR PIC 9(1) OCCURS 6 TIMES.
       01 I PIC 9(1).
       01 UF-X PIC 9(1).
       01 UF-RESULT PIC 9(1).
       01 UF-A PIC 9(1).
       01 UF-B PIC 9(1).
       01 ROOT-A PIC 9(1).
       01 ROOT-B PIC 9(1).

       PROCEDURE DIVISION.
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > NUM-NODES
               MOVE I - 1 TO PARENT-ARR(I)
           END-PERFORM

           MOVE 0 TO UF-A
           MOVE 1 TO UF-B
           PERFORM UNION-SETS

           MOVE 1 TO UF-A
           MOVE 2 TO UF-B
           PERFORM UNION-SETS

           MOVE 3 TO UF-A
           MOVE 4 TO UF-B
           PERFORM UNION-SETS

           MOVE 2 TO UF-X
           PERFORM FIND-ROOT
           MOVE UF-RESULT TO ROOT-A
           MOVE 0 TO UF-X
           PERFORM FIND-ROOT
           MOVE UF-RESULT TO ROOT-B
           IF ROOT-A = ROOT-B
               DISPLAY "0 AND 2 CONNECTED: YES"
           ELSE
               DISPLAY "0 AND 2 CONNECTED: NO"
           END-IF

           MOVE 3 TO UF-X
           PERFORM FIND-ROOT
           MOVE UF-RESULT TO ROOT-A
           MOVE 5 TO UF-X
           PERFORM FIND-ROOT
           MOVE UF-RESULT TO ROOT-B
           IF ROOT-A = ROOT-B
               DISPLAY "3 AND 5 CONNECTED: YES"
           ELSE
               DISPLAY "3 AND 5 CONNECTED: NO"
           END-IF

           STOP RUN.

       FIND-ROOT.
           MOVE UF-X TO UF-RESULT
           PERFORM UNTIL PARENT-ARR(UF-RESULT + 1) = UF-RESULT
               MOVE PARENT-ARR(UF-RESULT + 1) TO UF-RESULT
           END-PERFORM.

       UNION-SETS.
           MOVE UF-A TO UF-X
           PERFORM FIND-ROOT
           MOVE UF-RESULT TO ROOT-A
           MOVE UF-B TO UF-X
           PERFORM FIND-ROOT
           MOVE UF-RESULT TO ROOT-B
           IF ROOT-A NOT = ROOT-B
               MOVE ROOT-B TO PARENT-ARR(ROOT-A + 1)
           END-IF.
