       IDENTIFICATION DIVISION.
       PROGRAM-ID. RECAMANSEQUENCE.
      * Recaman: a(n) = a(n-1) - n if positive and unseen, else + n
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 SEEN-TABLE.
           05 SEEN PIC 9 OCCURS 200 TIMES VALUE 0.
       01 I PIC 99.
       01 CUR PIC S9(4) VALUE 0.
       01 NXT PIC S9(4).
       01 ED PIC Z(3)9.
       01 OUT-LINE PIC X(100) VALUE SPACES.
       01 PTR PIC 999 VALUE 1.

       PROCEDURE DIVISION.
           MOVE 1 TO SEEN(1)
           MOVE CUR TO ED
           STRING FUNCTION TRIM(ED) " " DELIMITED BY SIZE
               INTO OUT-LINE WITH POINTER PTR
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 19
               COMPUTE NXT = CUR - I
               IF NXT < 0
                   COMPUTE NXT = CUR + I
               ELSE
                   IF SEEN(NXT + 1) = 1
                       COMPUTE NXT = CUR + I
                   END-IF
               END-IF
               MOVE 1 TO SEEN(NXT + 1)
               MOVE NXT TO CUR
               MOVE CUR TO ED
               STRING FUNCTION TRIM(ED) " " DELIMITED BY SIZE
                   INTO OUT-LINE WITH POINTER PTR
           END-PERFORM
           DISPLAY FUNCTION TRIM(OUT-LINE)
           STOP RUN.
