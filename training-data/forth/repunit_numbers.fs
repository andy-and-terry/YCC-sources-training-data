\ Repunits: numbers made only of the digit 1
: repunits ( n -- )
  0 swap 0 do
    10 * 1+ dup .
  loop drop cr ;

5 repunits
