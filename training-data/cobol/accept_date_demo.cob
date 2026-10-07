       IDENTIFICATION DIVISION.
       PROGRAM-ID. ACCDATE.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 TODAY.
          05 YY PIC 99.
          05 MM PIC 99.
          05 DD PIC 99.
       01 NOW.
          05 HH PIC 99.
          05 MI PIC 99.
          05 SS PIC 99.
          05 CC PIC 99.
       01 WEEKDAY-NUM PIC 9.

       PROCEDURE DIVISION.
           ACCEPT TODAY FROM DATE
           ACCEPT NOW FROM TIME
           ACCEPT WEEKDAY-NUM FROM DAY-OF-WEEK
           DISPLAY "DATE: " YY "/" MM "/" DD
           DISPLAY "TIME: " HH ":" MI ":" SS
           DISPLAY "WEEKDAY (1=MON): " WEEKDAY-NUM
           STOP RUN.
