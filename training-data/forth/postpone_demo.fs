\ POSTPONE compiles the compilation behaviour of the next word
: UNLESS ( -- ) POSTPONE 0= POSTPONE IF ; IMMEDIATE

: CHECK ( n -- )
  UNLESS ." was zero" ELSE ." non-zero" THEN CR ;

0 CHECK
5 CHECK

: ENDUNLESS POSTPONE THEN ; IMMEDIATE
: CHECK2 ( n -- ) UNLESS ." zero!" ENDUNLESS CR ;
0 CHECK2
3 CHECK2
