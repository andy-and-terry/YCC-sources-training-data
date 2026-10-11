       IDENTIFICATION DIVISION.
       PROGRAM-ID. INSPBEFAFT.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 TXT     PIC X(20) VALUE "key=value=extra".
       01 CNT     PIC 99 VALUE 0.
       01 CNT2    PIC 99 VALUE 0.

       PROCEDURE DIVISION.
           INSPECT TXT TALLYING CNT FOR CHARACTERS
               BEFORE INITIAL "="
           INSPECT TXT TALLYING CNT2 FOR ALL "e"
               AFTER INITIAL "="
           DISPLAY "chars before first '=': " CNT
           DISPLAY "e after first '=': " CNT2
           STOP RUN.
