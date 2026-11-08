       IDENTIFICATION DIVISION.
       PROGRAM-ID. ROT13DEMO.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 MSG PIC X(13) VALUE "Hello, World!".
       PROCEDURE DIVISION.
           INSPECT MSG CONVERTING
               "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
               TO
               "NOPQRSTUVWXYZABCDEFGHIJKLMnopqrstuvwxyzabcdefghijklm"
           DISPLAY MSG
           STOP RUN.
