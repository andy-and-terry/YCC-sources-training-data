       IDENTIFICATION DIVISION.
       PROGRAM-ID. CLASSCONDITION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 SAMPLE-TABLE.
           05 SAMPLE-VALUE PIC X(6) OCCURS 4 TIMES.
       01 I PIC 9(1).

       PROCEDURE DIVISION.
           MOVE "123456" TO SAMPLE-VALUE(1)
           MOVE "ABCDEF" TO SAMPLE-VALUE(2)
           MOVE "AB12CD" TO SAMPLE-VALUE(3)
           MOVE "      " TO SAMPLE-VALUE(4)

           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 4
               DISPLAY "VALUE: [" SAMPLE-VALUE(I) "]"
               IF SAMPLE-VALUE(I) IS NUMERIC
                   DISPLAY "  NUMERIC"
               END-IF
               IF SAMPLE-VALUE(I) IS ALPHABETIC
                   DISPLAY "  ALPHABETIC"
               END-IF
               IF SAMPLE-VALUE(I) IS NOT NUMERIC
                   AND SAMPLE-VALUE(I) IS NOT ALPHABETIC
                   DISPLAY "  MIXED / OTHER"
               END-IF
           END-PERFORM
           STOP RUN.
