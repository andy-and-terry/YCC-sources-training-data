\ n(n+1)(2n+1)/6
: term { n }
  n n 1 + * 2 n * 1 + * 6 / ;

: main ( -- )
  16 1 do
    i 2 .r ."  -> " i term . cr
  loop ;

main
bye
