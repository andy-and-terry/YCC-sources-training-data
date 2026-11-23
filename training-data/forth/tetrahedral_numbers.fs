\ n(n+1)(n+2)/6
: term { n }
  n n 1 + * n 2 + * 6 / ;

: main ( -- )
  16 1 do
    i 2 .r ."  -> " i term . cr
  loop ;

main
bye
