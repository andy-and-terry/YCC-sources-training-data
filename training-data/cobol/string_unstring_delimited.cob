       IDENTIFICATION DIVISION.
       PROGRAM-ID. USTR.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 LINE-IN PIC X(20) VALUE "red,green,blue".
       01 A PIC X(8).
       01 B PIC X(8).
       01 C PIC X(8).
       PROCEDURE DIVISION.
           UNSTRING LINE-IN DELIMITED BY ","
               INTO A B C
           END-UNSTRING
           DISPLAY A
           DISPLAY B
           DISPLAY C
           STOP RUN.
