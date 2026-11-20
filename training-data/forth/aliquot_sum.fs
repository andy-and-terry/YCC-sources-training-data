\ Aliquot sum: sum of proper divisors.
: aliquot ( n -- s )
  0 swap dup 1 ?do dup i mod 0= if swap i + swap then loop drop ;
6 aliquot . 12 aliquot . 28 aliquot . cr
