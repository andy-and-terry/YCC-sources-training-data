\ n(n+1)/2+1
: term { n }
  n n 1 + * 2 / 1 + ;

: main ( -- )
  16 1 do
    i 2 .r ."  -> " i term . cr
  loop ;

main
bye
