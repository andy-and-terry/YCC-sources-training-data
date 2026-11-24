\ Aliquot sequence: replace n by the sum of its proper divisors.
: aliquot-sum ( n -- s )
  0 swap dup 2/ 1+ 1 ?do
    dup i mod 0= if swap i + swap then
  loop drop ;

: main
  12 dup .
  0 begin
    over 1 > over 19 < and
  while
    swap aliquot-sum dup . swap 1+
  repeat
  2drop cr ;
main
bye
