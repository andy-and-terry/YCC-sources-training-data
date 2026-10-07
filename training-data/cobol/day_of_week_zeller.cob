       IDENTIFICATION DIVISION.
       PROGRAM-ID. DAYOFWEEK.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 YR          PIC 9(4) VALUE 2024.
       01 MO          PIC 9(2) VALUE 12.
       01 DY          PIC 9(2) VALUE 25.
       01 K           PIC 9(2).
       01 J           PIC 9(2).
       01 H           PIC 9(2).
       01 TMP         PIC 9(5).
       01 T1          PIC 9(5).
       01 T2          PIC 9(5).
       01 T3          PIC 9(5).
       01 DAY-NAMES.
          05 FILLER PIC X(9) VALUE "SATURDAY".
          05 FILLER PIC X(9) VALUE "SUNDAY".
          05 FILLER PIC X(9) VALUE "MONDAY".
          05 FILLER PIC X(9) VALUE "TUESDAY".
          05 FILLER PIC X(9) VALUE "WEDNESDAY".
          05 FILLER PIC X(9) VALUE "THURSDAY".
          05 FILLER PIC X(9) VALUE "FRIDAY".
       01 DAY-TABLE REDEFINES DAY-NAMES.
          05 DAY-NAME PIC X(9) OCCURS 7 TIMES.
       01 IDX         PIC 9.

       PROCEDURE DIVISION.
           DIVIDE YR BY 100 GIVING J REMAINDER K
           COMPUTE T1 = 13 * (MO + 1)
           DIVIDE T1 BY 5 GIVING T1
           DIVIDE K BY 4 GIVING T2
           DIVIDE J BY 4 GIVING T3
           COMPUTE TMP = DY + T1 + K + T2 + T3 + 5 * J
           DIVIDE TMP BY 7 GIVING TMP REMAINDER H
           COMPUTE IDX = H + 1
           DISPLAY DY "/" MO "/" YR " IS A " DAY-NAME(IDX)
           STOP RUN.
