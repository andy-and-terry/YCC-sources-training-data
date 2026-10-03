       IDENTIFICATION DIVISION.
       PROGRAM-ID. ROMANNUMERALS.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 VALUES-TBL.
           05 VAL-ITEM PIC 9(4) OCCURS 13 TIMES
               VALUES 1000 900 500 400 100 90 50 40 10 9 5 4 1.
       01 SYMS-TBL.
           05 SYM-ITEM PIC X(2) OCCURS 13 TIMES
               VALUES "M " "CM" "D " "CD" "C " "XC" "L " "XL"
                      "X " "IX" "V " "IV" "I ".
       01 N PIC 9(4) VALUE 1994.
       01 RESULT PIC X(20) VALUE SPACES.
       01 IDX PIC 9(2).

       PROCEDURE DIVISION.
           PERFORM VARYING IDX FROM 1 BY 1 UNTIL IDX > 13
               PERFORM UNTIL N < VAL-ITEM(IDX)
                   FUNCTION TRIM(SYM-ITEM(IDX))
                   STRING FUNCTION TRIM(RESULT) DELIMITED BY SIZE
                          FUNCTION TRIM(SYM-ITEM(IDX)) DELIMITED BY SIZE
                       INTO RESULT
                   END-STRING
                   SUBTRACT VAL-ITEM(IDX) FROM N
               END-PERFORM
           END-PERFORM

           DISPLAY "ROMAN: " FUNCTION TRIM(RESULT)
           STOP RUN.
