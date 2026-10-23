\ Xorshift pseudo-random generator on 64-bit cells
VARIABLE seed
88172645463325252 seed !

: NEXT-RAND ( -- u )
  seed @
  DUP 13 LSHIFT XOR
  DUP 7 RSHIFT XOR
  DUP 17 LSHIFT XOR
  DUP seed ! ;

: RANDOM ( n -- 0..n-1 )  NEXT-RAND SWAP MOD ;

: ROLL-DIE ( -- 1..6 )  6 RANDOM 1+ ;

5 0 DO ROLL-DIE . LOOP CR
