       IDENTIFICATION DIVISION.
       PROGRAM-ID. LOWHIGH.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 KEY-TABLE.
          05 KEY-ENTRY  PIC X(3) OCCURS 5 TIMES.
       01 SENTINEL-KEY  PIC X(3) VALUE HIGH-VALUES.
       01 START-KEY     PIC X(3) VALUE LOW-VALUES.
       01 CANDIDATE     PIC X(3) VALUE "500".
       01 SMALLEST      PIC X(3).
       01 IDX           PIC 9 VALUE 0.

       PROCEDURE DIVISION.
           MOVE "410" TO KEY-ENTRY (1)
           MOVE "120" TO KEY-ENTRY (2)
           MOVE "905" TO KEY-ENTRY (3)
           MOVE "333" TO KEY-ENTRY (4)
           MOVE "250" TO KEY-ENTRY (5)

      *    HIGH-VALUES compares greater than any ordinary key,
      *    so it works as a starting minimum.
           MOVE HIGH-VALUES TO SMALLEST
           PERFORM VARYING IDX FROM 1 BY 1 UNTIL IDX > 5
               IF KEY-ENTRY (IDX) < SMALLEST
                   MOVE KEY-ENTRY (IDX) TO SMALLEST
               END-IF
           END-PERFORM
           DISPLAY "Smallest key: " SMALLEST

           IF CANDIDATE > START-KEY
               DISPLAY "500 is greater than LOW-VALUES"
           END-IF
           IF CANDIDATE < SENTINEL-KEY
               DISPLAY "500 is less than HIGH-VALUES"
           END-IF
           IF START-KEY = LOW-VALUES
               DISPLAY "START-KEY is still LOW-VALUES"
           END-IF
           STOP RUN.
