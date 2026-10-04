\ Reverse the digits of a non-negative integer

: REVERSE-DIGITS ( n -- n' )
  0 SWAP
  BEGIN
    DUP 0 >
  WHILE
    10 /MOD             \ acc rem quot
    ROT 10 * ROT +      \ quot acc'
    SWAP
  REPEAT
  DROP ;

123 REVERSE-DIGITS . CR
1200 REVERSE-DIGITS . CR
7 REVERSE-DIGITS . CR
9876543 REVERSE-DIGITS . CR
