       IDENTIFICATION DIVISION.
       PROGRAM-ID. UNSTRMULTI.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 LINE-IN   PIC X(30) VALUE "red,green;blue,yellow".
       01 P1        PIC X(8).
       01 P2        PIC X(8).
       01 P3        PIC X(8).
       01 P4        PIC X(8).
       01 TALLY-CT  PIC 9 VALUE 0.

       PROCEDURE DIVISION.
           UNSTRING LINE-IN DELIMITED BY "," OR ";"
               INTO P1 P2 P3 P4
               TALLYING IN TALLY-CT
           END-UNSTRING
           DISPLAY TALLY-CT " fields: " P1 "|" P2 "|" P3 "|" P4
           STOP RUN.
