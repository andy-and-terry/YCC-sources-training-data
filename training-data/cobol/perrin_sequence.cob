      * Perrin sequence P(n)=P(n-2)+P(n-3)
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PerrinSequence.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 V-TABLE.
          05 V   PIC 9(6) OCCURS 10 TIMES.
       01 I      PIC 99.
       01 J      PIC 99.
       01 K      PIC 99.

       PROCEDURE DIVISION.
           MOVE 3 TO V(1)
           MOVE 0 TO V(2)
           MOVE 2 TO V(3)
           PERFORM VARYING I FROM 4 BY 1 UNTIL I > 10
               COMPUTE J = I - 2
               COMPUTE K = I - 3
               COMPUTE V(I) = V(J) + V(K)
           END-PERFORM
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 10
               DISPLAY V(I)
           END-PERFORM
           STOP RUN.
