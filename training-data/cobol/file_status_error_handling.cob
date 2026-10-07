       IDENTIFICATION DIVISION.
       PROGRAM-ID. FILESTATUSDEMO.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT DATA-FILE ASSIGN TO "sample.dat"
               ORGANIZATION IS LINE SEQUENTIAL
               FILE STATUS IS WS-FILE-STATUS.

       DATA DIVISION.
       FILE SECTION.
       FD DATA-FILE.
       01 DATA-RECORD PIC X(40).

       WORKING-STORAGE SECTION.
       01 WS-FILE-STATUS PIC XX.
       01 WS-EOF PIC X VALUE "N".

       PROCEDURE DIVISION.
           OPEN INPUT DATA-FILE
           IF WS-FILE-STATUS = "35"
               DISPLAY "FILE NOT FOUND, SKIPPING READ"
           ELSE IF WS-FILE-STATUS NOT = "00"
               DISPLAY "OPEN FAILED, STATUS: " WS-FILE-STATUS
           ELSE
               PERFORM UNTIL WS-EOF = "Y"
                   READ DATA-FILE
                       AT END MOVE "Y" TO WS-EOF
                       NOT AT END DISPLAY DATA-RECORD
                   END-READ
               END-PERFORM
               CLOSE DATA-FILE
           END-IF
           STOP RUN.
