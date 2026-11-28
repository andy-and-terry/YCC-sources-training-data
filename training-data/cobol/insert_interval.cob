       IDENTIFICATION DIVISION.
       PROGRAM-ID. INSERT-INTERVAL.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 IV-DATA.
          05 FILLER PIC 9(2) VALUE 1.
          05 FILLER PIC 9(2) VALUE 3.
          05 FILLER PIC 9(2) VALUE 6.
          05 FILLER PIC 9(2) VALUE 9.
       01 IVS REDEFINES IV-DATA.
          05 IV OCCURS 2 TIMES.
             10 IV-LO  PIC 9(2).
             10 IV-HI  PIC 9(2).
       01 NEW-LO      PIC 9(2) VALUE 2.
       01 NEW-HI      PIC 9(2) VALUE 5.
       01 I           PIC 9(2).
       01 PLACED      PIC X VALUE "N".

       PROCEDURE DIVISION.
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 2
               EVALUATE TRUE
                   WHEN IV-HI(I) < NEW-LO
                       DISPLAY "[" IV-LO(I) "," IV-HI(I) "]"
                   WHEN IV-LO(I) > NEW-HI
                       IF PLACED = "N"
                           DISPLAY "[" NEW-LO "," NEW-HI "]"
                           MOVE "Y" TO PLACED
                       END-IF
                       DISPLAY "[" IV-LO(I) "," IV-HI(I) "]"
                   WHEN OTHER
                       IF IV-LO(I) < NEW-LO MOVE IV-LO(I) TO NEW-LO END-IF
                       IF IV-HI(I) > NEW-HI MOVE IV-HI(I) TO NEW-HI END-IF
               END-EVALUATE
           END-PERFORM
           IF PLACED = "N"
               DISPLAY "[" NEW-LO "," NEW-HI "]"
           END-IF
           STOP RUN.
