\ 2n(n-1)+1
: term { n }
  2 n * n 1 - * 1 + ;

: main ( -- )
  16 1 do
    i 2 .r ."  -> " i term . cr
  loop ;

main
bye
