\ Highest value reached by the Collatz (hailstone) sequence from n
: step ( n -- n' ) dup 2 mod 0= if 2/ else 3 * 1+ then ;

: peak ( n -- best )
  dup
  begin over 1 <> while
    swap step swap over max
  repeat nip ;

27 peak . cr
