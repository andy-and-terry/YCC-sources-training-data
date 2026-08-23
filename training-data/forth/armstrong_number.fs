: NUM-DIGITS ( n -- count )
  0 SWAP
  BEGIN
    DUP 0>
  WHILE
    SWAP 1+ SWAP 10 /
  REPEAT
  DROP ;

: IPOW ( base exp -- result )
  1 SWAP
  0 DO OVER * LOOP
  SWAP DROP ;

: ARMSTRONG? ( n -- flag )
  DUP NUM-DIGITS >R
  0 SWAP
  BEGIN
    DUP 0>
  WHILE
    DUP 10 MOD R@ IPOW ROT + SWAP
    10 /
  REPEAT
  DROP R> DROP
  ;

153 DUP ARMSTRONG? .
154 DUP ARMSTRONG? .
CR
