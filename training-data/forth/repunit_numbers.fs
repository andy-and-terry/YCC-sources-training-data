\ Repunits: R_n = 11...1 (n ones), built as R_{n-1}*10 + 1.
: main
  0
  9 1 do
    10 * 1+
    dup .
    dup 3 mod 0= if ." (divisible by 3)" then
    cr
  loop
  drop ;
main
bye
