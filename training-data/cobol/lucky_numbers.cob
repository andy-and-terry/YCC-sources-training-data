       IDENTIFICATION DIVISION.
       PROGRAM-ID. LUCKYNUMBERS.
      * Lucky numbers below 100: from the odd numbers, delete every k-th
      * survivor, where k is the next surviving number
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 NUMS-TABLE.
           05 NUM PIC 999 OCCURS 100 TIMES VALUE 0.
       01 LEN PIC 999 VALUE 0.
       01 IDX PIC 999 VALUE 2.
       01 K PIC 999.
       01 KEPT PIC 999.
       01 P PIC 999.
       01 N PIC 999.
       01 ED PIC Z(2)9.
       01 OUT-LINE PIC X(200) VALUE SPACES.
       01 PTR PIC 999 VALUE 1.

       PROCEDURE DIVISION.
           PERFORM VARYING N FROM 1 BY 2 UNTIL N > 99
               ADD 1 TO LEN
               MOVE N TO NUM(LEN)
           END-PERFORM
           PERFORM UNTIL IDX > LEN OR NUM(IDX) > LEN
               MOVE NUM(IDX) TO K
               MOVE 0 TO KEPT
               PERFORM VARYING P FROM 1 BY 1 UNTIL P > LEN
                   IF FUNCTION MOD(P, K) NOT = 0
                       ADD 1 TO KEPT
                       MOVE NUM(P) TO NUM(KEPT)
                   END-IF
               END-PERFORM
               MOVE KEPT TO LEN
               ADD 1 TO IDX
           END-PERFORM
           PERFORM VARYING P FROM 1 BY 1 UNTIL P > LEN
               MOVE NUM(P) TO ED
               STRING FUNCTION TRIM(ED) " " DELIMITED BY SIZE
                   INTO OUT-LINE WITH POINTER PTR
           END-PERFORM
           DISPLAY FUNCTION TRIM(OUT-LINE)
           STOP RUN.
