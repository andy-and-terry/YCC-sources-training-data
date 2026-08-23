: VOWEL? ( c -- flag )
  DUP [CHAR] a = SWAP
  DUP [CHAR] e = SWAP
  DUP [CHAR] i = SWAP
  DUP [CHAR] o = SWAP
  [CHAR] u =
  OR OR OR OR ;

: COUNT-VOWELS ( addr len -- count )
  0 -ROT
  OVER + SWAP
  BEGIN
    2DUP <
  WHILE
    DUP C@ VOWEL? IF ROT 1+ ROT SWAP THEN SWAP
    1+
  REPEAT
  2DROP ;

S" hello world" COUNT-VOWELS .
CR
