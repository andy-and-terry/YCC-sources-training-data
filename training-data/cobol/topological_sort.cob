       IDENTIFICATION DIVISION.
       PROGRAM-ID. TOPOSORT.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 NUM-NODES PIC 9(1) VALUE 6.
       01 NUM-EDGES PIC 9(1) VALUE 6.
       01 EDGE-TABLE.
           05 EDGE-ENTRY OCCURS 6 TIMES.
               10 EDGE-FROM PIC 9(1).
               10 EDGE-TO PIC 9(1).
       01 IN-DEGREE PIC 9(1) OCCURS 6 TIMES VALUE 0.
       01 QUEUE-ARR PIC 9(1) OCCURS 6 TIMES.
       01 QUEUE-HEAD PIC 9(1) VALUE 1.
       01 QUEUE-TAIL PIC 9(1) VALUE 1.
       01 RESULT-ARR PIC 9(1) OCCURS 6 TIMES.
       01 RESULT-COUNT PIC 9(1) VALUE 0.
       01 I PIC 9(1).
       01 E PIC 9(1).
       01 CUR-NODE PIC 9(1).

       PROCEDURE DIVISION.
           MOVE 5 TO EDGE-FROM(1)
           MOVE 2 TO EDGE-TO(1)
           MOVE 5 TO EDGE-FROM(2)
           MOVE 0 TO EDGE-TO(2)
           MOVE 4 TO EDGE-FROM(3)
           MOVE 0 TO EDGE-TO(3)
           MOVE 4 TO EDGE-FROM(4)
           MOVE 1 TO EDGE-TO(4)
           MOVE 2 TO EDGE-FROM(5)
           MOVE 3 TO EDGE-TO(5)
           MOVE 3 TO EDGE-FROM(6)
           MOVE 1 TO EDGE-TO(6)

           PERFORM VARYING E FROM 1 BY 1 UNTIL E > NUM-EDGES
               ADD 1 TO IN-DEGREE(EDGE-TO(E) + 1)
           END-PERFORM

           PERFORM VARYING I FROM 1 BY 1 UNTIL I > NUM-NODES
               IF IN-DEGREE(I) = 0
                   MOVE I - 1 TO QUEUE-ARR(QUEUE-TAIL)
                   ADD 1 TO QUEUE-TAIL
               END-IF
           END-PERFORM

           PERFORM UNTIL QUEUE-HEAD = QUEUE-TAIL
               MOVE QUEUE-ARR(QUEUE-HEAD) TO CUR-NODE
               ADD 1 TO QUEUE-HEAD
               ADD 1 TO RESULT-COUNT
               MOVE CUR-NODE TO RESULT-ARR(RESULT-COUNT)

               PERFORM VARYING E FROM 1 BY 1 UNTIL E > NUM-EDGES
                   IF EDGE-FROM(E) = CUR-NODE
                       SUBTRACT 1 FROM IN-DEGREE(EDGE-TO(E) + 1)
                       IF IN-DEGREE(EDGE-TO(E) + 1) = 0
                           MOVE EDGE-TO(E) TO QUEUE-ARR(QUEUE-TAIL)
                           ADD 1 TO QUEUE-TAIL
                       END-IF
                   END-IF
               END-PERFORM
           END-PERFORM

           DISPLAY "TOPOLOGICAL ORDER:"
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > RESULT-COUNT
               DISPLAY RESULT-ARR(I)
           END-PERFORM
           STOP RUN.
