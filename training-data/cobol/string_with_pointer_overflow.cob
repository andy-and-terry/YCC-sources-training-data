       IDENTIFICATION DIVISION.
       PROGRAM-ID. STRPTR.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-LINE      PIC X(20) VALUE SPACES.
       01 WS-POS       PIC 99 VALUE 1.
       01 WS-SMALL     PIC X(8) VALUE SPACES.
       01 WS-SPOS      PIC 99 VALUE 1.

       PROCEDURE DIVISION.
      * STRING appends at WS-POS and advances it past the data written
           STRING "Hello" DELIMITED BY SIZE
                  ", " DELIMITED BY SIZE
               INTO WS-LINE WITH POINTER WS-POS
           END-STRING
           STRING "World" DELIMITED BY SIZE
               INTO WS-LINE WITH POINTER WS-POS
           END-STRING
           DISPLAY "Line: [" WS-LINE "]"
           DISPLAY "Next free position: " WS-POS

      * ON OVERFLOW triggers when the receiving field is too short
           STRING "ABCDE" DELIMITED BY SIZE
                  "FGHIJK" DELIMITED BY SIZE
               INTO WS-SMALL WITH POINTER WS-SPOS
               ON OVERFLOW
                   DISPLAY "Overflow: result truncated"
               NOT ON OVERFLOW
                   DISPLAY "Fit without truncation"
           END-STRING
           DISPLAY "Small: [" WS-SMALL "]"
           STOP RUN.
