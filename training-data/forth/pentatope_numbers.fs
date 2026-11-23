\ n(n+1)(n+2)(n+3)/24
: term { n }
  n n 1 + * n 2 + * n 3 + * 24 / ;

: main ( -- )
  16 1 do
    i 2 .r ."  -> " i term . cr
  loop ;

main
bye
