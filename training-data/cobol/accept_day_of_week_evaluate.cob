       IDENTIFICATION DIVISION.
       PROGRAM-ID. DAYOFWEEK.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-DOW        PIC 9.
       01 WS-DAY-NAME   PIC X(9).
       01 WS-KIND       PIC X(7).
       01 WS-DATE       PIC 9(8) VALUE 20240315.
       01 WS-INT-DATE   PIC 9(7).
       01 WS-REM        PIC 9.

       PROCEDURE DIVISION.
      * ACCEPT ... FROM DAY-OF-WEEK gives 1 (Monday) to 7 (Sunday)
           ACCEPT WS-DOW FROM DAY-OF-WEEK
           DISPLAY "Today index (1-7): " WS-DOW

      * Same mapping for an arbitrary date via integer dates
           COMPUTE WS-INT-DATE = FUNCTION INTEGER-OF-DATE(WS-DATE)
           COMPUTE WS-REM = FUNCTION MOD(WS-INT-DATE - 1, 7) + 1
           MOVE WS-REM TO WS-DOW

           EVALUATE WS-DOW
               WHEN 1 MOVE "Monday"    TO WS-DAY-NAME
               WHEN 2 MOVE "Tuesday"   TO WS-DAY-NAME
               WHEN 3 MOVE "Wednesday" TO WS-DAY-NAME
               WHEN 4 MOVE "Thursday"  TO WS-DAY-NAME
               WHEN 5 MOVE "Friday"    TO WS-DAY-NAME
               WHEN 6 MOVE "Saturday"  TO WS-DAY-NAME
               WHEN 7 MOVE "Sunday"    TO WS-DAY-NAME
           END-EVALUATE

           EVALUATE WS-DOW
               WHEN 1 THRU 5 MOVE "Weekday" TO WS-KIND
               WHEN OTHER    MOVE "Weekend" TO WS-KIND
           END-EVALUATE

           DISPLAY WS-DATE " is a " WS-DAY-NAME " (" WS-KIND ")"
           STOP RUN.
