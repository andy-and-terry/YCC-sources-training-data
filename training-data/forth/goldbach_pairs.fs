\ Goldbach pairs for 28
: prime? ( n -- f )
  dup 2 < if drop 0 exit then
  1 swap dup 2 ?do dup i mod 0= if swap drop 0 swap then loop drop ;
: goldbach ( n -- )  dup 2/ 1+ 2 do dup i - i prime? over i - prime? and if i . ." + " dup i - . cr then loop drop ;
28 goldbach
bye
