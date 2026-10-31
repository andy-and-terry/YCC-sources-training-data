       IDENTIFICATION DIVISION.
       PROGRAM-ID. SELFDESC.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 S        PIC X(5) VALUE "21200".
       01 LEN      PIC 9 VALUE 5.
       01 I        PIC 9.
       01 J        PIC 9.
       01 CNT      PIC 9.
       01 EXPECTED PIC 9.
       01 TARGET   PIC 9.
       01 OK       PIC X VALUE "Y".
       PROCEDURE DIVISION.
           PERFORM VARYING I FROM 0 BY 1 UNTIL I >= LEN
               MOVE 0 TO CNT
               MOVE I TO TARGET
               PERFORM VARYING J FROM 1 BY 1 UNTIL J > LEN
                   IF S(J:1) = TARGET
                       ADD 1 TO CNT
                   END-IF
               END-PERFORM
               MOVE S(I + 1:1) TO EXPECTED
               IF CNT NOT = EXPECTED
                   MOVE "N" TO OK
               END-IF
           END-PERFORM
           DISPLAY S " " OK
           STOP RUN.
