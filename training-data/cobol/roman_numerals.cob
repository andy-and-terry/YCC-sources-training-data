       IDENTIFICATION DIVISION.
       PROGRAM-ID. ROMANNUMERALS.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 VALUES-TABLE.
           05 RVAL PIC 9(4) OCCURS 13 TIMES.
       01 SYMBOLS-TABLE.
           05 RSYM PIC X(2) OCCURS 13 TIMES.
       01 NUM PIC 9(4) VALUE 1994.
       01 RESULT-STR PIC X(20) VALUE SPACES.
       01 I PIC 9(2).

       PROCEDURE DIVISION.
           MOVE 1000 TO RVAL(1)
           MOVE "M "  TO RSYM(1)
           MOVE 900  TO RVAL(2)
           MOVE "CM" TO RSYM(2)
           MOVE 500  TO RVAL(3)
           MOVE "D "  TO RSYM(3)
           MOVE 400  TO RVAL(4)
           MOVE "CD" TO RSYM(4)
           MOVE 100  TO RVAL(5)
           MOVE "C "  TO RSYM(5)
           MOVE 90   TO RVAL(6)
           MOVE "XC" TO RSYM(6)
           MOVE 50   TO RVAL(7)
           MOVE "L "  TO RSYM(7)
           MOVE 40   TO RVAL(8)
           MOVE "XL" TO RSYM(8)
           MOVE 10   TO RVAL(9)
           MOVE "X "  TO RSYM(9)
           MOVE 9    TO RVAL(10)
           MOVE "IX" TO RSYM(10)
           MOVE 5    TO RVAL(11)
           MOVE "V "  TO RSYM(11)
           MOVE 4    TO RVAL(12)
           MOVE "IV" TO RSYM(12)
           MOVE 1    TO RVAL(13)
           MOVE "I "  TO RSYM(13)

           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 13
               PERFORM UNTIL NUM < RVAL(I)
                   STRING FUNCTION TRIM(RESULT-STR) DELIMITED BY SIZE
                          FUNCTION TRIM(RSYM(I)) DELIMITED BY SIZE
                          INTO RESULT-STR
                   SUBTRACT RVAL(I) FROM NUM
               END-PERFORM
           END-PERFORM

           DISPLAY "ROMAN: " FUNCTION TRIM(RESULT-STR)
           STOP RUN.
