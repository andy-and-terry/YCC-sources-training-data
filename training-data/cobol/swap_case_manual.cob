       IDENTIFICATION DIVISION.
       PROGRAM-ID. SWAP-CASE-MANUAL.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-TEXT PIC X(14) VALUE "Hello World 42".
       PROCEDURE DIVISION.
           INSPECT WS-TEXT CONVERTING
               "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
               TO
               "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
           DISPLAY WS-TEXT
           STOP RUN.
