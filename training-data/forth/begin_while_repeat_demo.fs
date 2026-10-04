\ Count how many times 2 divides n (the 2-adic valuation).
: TWO-FACTORS ( n -- count )
  0 SWAP
  BEGIN
    DUP 2 MOD 0=
    OVER 0<> AND
  WHILE
    2 /
    SWAP 1+ SWAP
  REPEAT
  DROP ;

\ Steps for n to reach 1 in the Collatz process.
: COLLATZ-STEPS ( n -- steps )
  0 SWAP
  BEGIN
    DUP 1 >
  WHILE
    DUP 2 MOD IF 3 * 1+ ELSE 2/ THEN
    SWAP 1+ SWAP
  REPEAT
  DROP ;

40 TWO-FACTORS . CR
96 TWO-FACTORS . CR
7 TWO-FACTORS . CR
27 COLLATZ-STEPS . CR
6 COLLATZ-STEPS . CR
