       IDENTIFICATION DIVISION.
       PROGRAM-ID. RUNLENGTHENCODE.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 SOURCE-STR PIC X(9) VALUE "AAABCCCCD".
       01 RESULT-STR PIC X(30) VALUE SPACES.
       01 I PIC 9(2) VALUE 1.
       01 RUN-COUNT PIC 9 VALUE 0.
       01 CH PIC X.
       01 NEXT-I PIC 9(2).

       PROCEDURE DIVISION.
           PERFORM UNTIL I > 9
               MOVE SOURCE-STR(I:1) TO CH
               MOVE 1 TO RUN-COUNT
               MOVE I TO NEXT-I
               ADD 1 TO NEXT-I
               PERFORM UNTIL NEXT-I > 9
                       OR SOURCE-STR(NEXT-I:1) NOT = CH
                   ADD 1 TO RUN-COUNT
                   ADD 1 TO NEXT-I
               END-PERFORM
               STRING FUNCTION TRIM(RESULT-STR) DELIMITED BY SIZE
                      RUN-COUNT DELIMITED BY SIZE
                      CH DELIMITED BY SIZE
                      INTO RESULT-STR
               MOVE NEXT-I TO I
           END-PERFORM
           DISPLAY RESULT-STR
           STOP RUN.
