       IDENTIFICATION DIVISION.
       PROGRAM-ID. TETRAHEDRAL-NUMBERS.
      * n(n+1)(n+2)/6
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 N       PIC 9(3).
       01 V       PIC 9(7).
       01 N-OUT   PIC Z9.
       01 V-OUT   PIC Z(6)9.

       PROCEDURE DIVISION.
           PERFORM VARYING N FROM 1 BY 1 UNTIL N > 15
               COMPUTE V = ((N * (N + 1)) * (N + 2)) / 6
               MOVE N TO N-OUT
               MOVE V TO V-OUT
               DISPLAY N-OUT " -> " V-OUT
           END-PERFORM
           STOP RUN.
