       IDENTIFICATION DIVISION.
       PROGRAM-ID. MULTGRIDPTR.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 R     PIC 9.
       01 C     PIC 9.
       01 P     PIC 99.
       01 ED-P  PIC Z9.
       01 LINE-OUT PIC X(30).
       01 PTR   PIC 99.

       PROCEDURE DIVISION.
           PERFORM VARYING R FROM 1 BY 1 UNTIL R > 5
               MOVE SPACES TO LINE-OUT
               MOVE 1 TO PTR
               PERFORM VARYING C FROM 1 BY 1 UNTIL C > 5
                   COMPUTE P = R * C
                   MOVE P TO ED-P
                   STRING ED-P " " DELIMITED BY SIZE
                       INTO LINE-OUT WITH POINTER PTR
               END-PERFORM
               DISPLAY LINE-OUT
           END-PERFORM
           STOP RUN.
