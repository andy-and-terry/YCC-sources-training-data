       IDENTIFICATION DIVISION.
       PROGRAM-ID. SECTIONFLOW.
       PROCEDURE DIVISION.
       MAIN-SECTION SECTION.
       MAIN-PARA.
           DISPLAY "main: start"
           PERFORM INIT-SECTION
           PERFORM WORK-PARA
           DISPLAY "main: end"
           STOP RUN.
       INIT-SECTION SECTION.
       INIT-PARA-1.
           DISPLAY "init: step one".
       INIT-PARA-2.
           DISPLAY "init: step two".
       WORK-SECTION SECTION.
       WORK-PARA.
           DISPLAY "work: doing the job".
