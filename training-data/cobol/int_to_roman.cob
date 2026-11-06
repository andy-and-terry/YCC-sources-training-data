       IDENTIFICATION DIVISION.
       PROGRAM-ID. TOROMAN.
      * Integer (1..3999) to Roman numeral using a greedy table.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 N           PIC 9(4) VALUE 1994.
       01 I           PIC 99.
       01 OUT-STR     PIC X(20) VALUE SPACES.
       01 PTR         PIC 99 VALUE 1.
       01 VALS-DATA.
          05 FILLER PIC 9(4) VALUE 1000.
          05 FILLER PIC 9(4) VALUE 0900.
          05 FILLER PIC 9(4) VALUE 0500.
          05 FILLER PIC 9(4) VALUE 0400.
          05 FILLER PIC 9(4) VALUE 0100.
          05 FILLER PIC 9(4) VALUE 0090.
          05 FILLER PIC 9(4) VALUE 0050.
          05 FILLER PIC 9(4) VALUE 0040.
          05 FILLER PIC 9(4) VALUE 0010.
          05 FILLER PIC 9(4) VALUE 0009.
          05 FILLER PIC 9(4) VALUE 0005.
          05 FILLER PIC 9(4) VALUE 0004.
          05 FILLER PIC 9(4) VALUE 0001.
       01 VALS REDEFINES VALS-DATA.
          05 V        PIC 9(4) OCCURS 13 TIMES.
       01 SYMS-DATA.
          05 FILLER PIC XX VALUE "M ".
          05 FILLER PIC XX VALUE "CM".
          05 FILLER PIC XX VALUE "D ".
          05 FILLER PIC XX VALUE "CD".
          05 FILLER PIC XX VALUE "C ".
          05 FILLER PIC XX VALUE "XC".
          05 FILLER PIC XX VALUE "L ".
          05 FILLER PIC XX VALUE "XL".
          05 FILLER PIC XX VALUE "X ".
          05 FILLER PIC XX VALUE "IX".
          05 FILLER PIC XX VALUE "V ".
          05 FILLER PIC XX VALUE "IV".
          05 FILLER PIC XX VALUE "I ".
       01 SYMS REDEFINES SYMS-DATA.
          05 S        PIC XX OCCURS 13 TIMES.
       PROCEDURE DIVISION.
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 13
               PERFORM UNTIL N < V(I)
                   STRING S(I) DELIMITED BY SPACE
                       INTO OUT-STR WITH POINTER PTR
                   SUBTRACT V(I) FROM N
               END-PERFORM
           END-PERFORM
           DISPLAY OUT-STR
           STOP RUN.
