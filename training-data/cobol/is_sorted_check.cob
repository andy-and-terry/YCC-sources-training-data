       IDENTIFICATION DIVISION.
       PROGRAM-ID. IS-SORTED.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 NUM-TABLE.
          05 NUM       PIC 9(3) OCCURS 6 TIMES.
       01 I           PIC 9(2) VALUE 0.
       01 SORTED-FLAG PIC X VALUE "Y".
          88 IS-SORTED VALUE "Y".
          88 NOT-SORTED VALUE "N".

       PROCEDURE DIVISION.
           MOVE 010 TO NUM(1)
           MOVE 020 TO NUM(2)
           MOVE 020 TO NUM(3)
           MOVE 035 TO NUM(4)
           MOVE 030 TO NUM(5)
           MOVE 050 TO NUM(6)
           PERFORM VARYING I FROM 2 BY 1 UNTIL I > 6
               IF NUM(I) < NUM(I - 1)
                   SET NOT-SORTED TO TRUE
               END-IF
           END-PERFORM
           IF IS-SORTED
               DISPLAY "ARRAY IS SORTED"
           ELSE
               DISPLAY "ARRAY IS NOT SORTED"
           END-IF
           STOP RUN.
