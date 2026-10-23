      * Padovan numbers: P(n) = P(n-2) + P(n-3), P(0)=P(1)=P(2)=1
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PADOVAN.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 P-TABLE.
          05 P      PIC 9(6) OCCURS 15 TIMES.
       01 I         PIC 99.
       01 J         PIC 99.
       01 K         PIC 99.
       01 OUT-NUM   PIC Z(5)9.

       PROCEDURE DIVISION.
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 15
               IF I <= 3
                   MOVE 1 TO P(I)
               ELSE
                   COMPUTE J = I - 2
                   COMPUTE K = I - 3
                   COMPUTE P(I) = P(J) + P(K)
               END-IF
               MOVE P(I) TO OUT-NUM
               DISPLAY OUT-NUM WITH NO ADVANCING
           END-PERFORM
           DISPLAY " "
           STOP RUN.
