\ n^2(n+1)/2
: term { n }
  n n * n 1 + * 2 / ;

: main ( -- )
  16 1 do
    i 2 .r ."  -> " i term . cr
  loop ;

main
bye
