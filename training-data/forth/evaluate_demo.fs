\ EVALUATE interprets a string as Forth source
S" 3 4 + ." EVALUATE CR

: RUN-STR ( addr u -- ) EVALUATE ;
S" : SQUARE DUP * ;" RUN-STR
S" 12 SQUARE . CR" RUN-STR

S" 10 0 DO I . LOOP CR" EVALUATE
