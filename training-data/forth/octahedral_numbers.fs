\ n(2n^2+1)/3
: term { n }
  n 2 n * n * 1 + * 3 / ;

: main ( -- )
  16 1 do
    i 2 .r ."  -> " i term . cr
  loop ;

main
bye
