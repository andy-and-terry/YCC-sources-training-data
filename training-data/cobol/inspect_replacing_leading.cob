       IDENTIFICATION DIVISION.
       PROGRAM-ID. INSPREPL.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-ACCOUNT   PIC X(10) VALUE "0000012345".
       01 WS-PHONE     PIC X(12) VALUE "555-867-5309".
       01 WS-TEXT      PIC X(20) VALUE "aaa bbb aaa ccc aaa".
       01 WS-COUNT     PIC 99 VALUE 0.

       PROCEDURE DIVISION.
      * Replace only LEADING zeros with spaces
           INSPECT WS-ACCOUNT REPLACING LEADING "0" BY SPACE
           DISPLAY "Account: [" WS-ACCOUNT "]"

      * Mask digits in a phone number except the last four
           INSPECT WS-PHONE(1:8) CONVERTING "0123456789"
                                         TO "XXXXXXXXXX"
           DISPLAY "Phone:   [" WS-PHONE "]"

      * FIRST replaces just the first occurrence
           INSPECT WS-TEXT REPLACING FIRST "aaa" BY "zzz"
           DISPLAY "First:   [" WS-TEXT "]"

      * ALL with a count taken beforehand
           INSPECT WS-TEXT TALLYING WS-COUNT FOR ALL "aaa"
           DISPLAY "Remaining aaa: " WS-COUNT

           INSPECT WS-TEXT REPLACING ALL "aaa" BY "---"
           DISPLAY "All:     [" WS-TEXT "]"
           STOP RUN.
