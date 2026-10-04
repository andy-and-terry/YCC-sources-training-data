       IDENTIFICATION DIVISION.
       PROGRAM-ID. REFMODDEMO.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 TEXT-LINE   PIC X(20) VALUE "HELLO WORLD".
       01 DATE-TEXT   PIC X(8) VALUE "20240517".
       01 I           PIC 99.
       01 VOWELS      PIC 99 VALUE 0.
       01 REVERSED    PIC X(11).
       01 LEN         PIC 99 VALUE 11.

       PROCEDURE DIVISION.
           DISPLAY "FIRST FIVE:   " TEXT-LINE(1:5)
           DISPLAY "FROM SEVENTH: " TEXT-LINE(7:5)
           DISPLAY "YEAR:  " DATE-TEXT(1:4)
           DISPLAY "MONTH: " DATE-TEXT(5:2)
           DISPLAY "DAY:   " DATE-TEXT(7:2)

           MOVE "J" TO TEXT-LINE(1:1)
           MOVE "ELLO" TO TEXT-LINE(2:4)
           DISPLAY "MODIFIED:     " TEXT-LINE

           PERFORM VARYING I FROM 1 BY 1 UNTIL I > LEN
               MOVE TEXT-LINE(I:1) TO REVERSED(LEN - I + 1:1)
               IF TEXT-LINE(I:1) = "A" OR "E" OR "I" OR "O" OR "U"
                   ADD 1 TO VOWELS
               END-IF
           END-PERFORM
           DISPLAY "REVERSED:     " REVERSED
           DISPLAY "VOWELS:       " VOWELS
           STOP RUN.
