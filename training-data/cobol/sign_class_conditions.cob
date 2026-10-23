       IDENTIFICATION DIVISION.
       PROGRAM-ID. SIGNCLASS.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 AMOUNT     PIC S9(5) VALUE -42.
       01 ZIP-CODE   PIC X(5)  VALUE "90210".
       01 CODE-A     PIC X(5)  VALUE "AB1CD".
       01 NAME-UP    PIC X(5)  VALUE "SMITH".
       01 NAME-LOW   PIC X(5)  VALUE "smith".

       PROCEDURE DIVISION.
           IF AMOUNT IS NEGATIVE
               DISPLAY "AMOUNT is negative"
           END-IF
           IF AMOUNT IS NOT POSITIVE
               DISPLAY "AMOUNT is not positive"
           END-IF
           MOVE 0 TO AMOUNT
           IF AMOUNT IS ZERO
               DISPLAY "AMOUNT is zero"
           END-IF

           IF ZIP-CODE IS NUMERIC
               DISPLAY "ZIP-CODE is numeric"
           END-IF
           IF CODE-A IS NOT NUMERIC
               DISPLAY "CODE-A is not numeric"
           END-IF
           IF CODE-A IS NOT ALPHABETIC
               DISPLAY "CODE-A is not purely alphabetic"
           END-IF
           IF NAME-UP IS ALPHABETIC-UPPER
               DISPLAY "NAME-UP is upper case"
           END-IF
           IF NAME-LOW IS ALPHABETIC-LOWER
               DISPLAY "NAME-LOW is lower case"
           END-IF
           STOP RUN.
