\ Pangram check: does a string contain every letter a-z?

CREATE SEEN 26 ALLOT

: LETTER-INDEX ( c -- idx | -1 )
  DUP [CHAR] a [CHAR] z 1+ WITHIN IF [CHAR] a - EXIT THEN
  DUP [CHAR] A [CHAR] Z 1+ WITHIN IF [CHAR] A - EXIT THEN
  DROP -1 ;

: MARK ( c -- )
  LETTER-INDEX DUP 0< IF DROP ELSE SEEN + 1 SWAP C! THEN ;

: PANGRAM? ( addr len -- flag )
  SEEN 26 ERASE
  OVER + SWAP DO I C@ MARK LOOP
  -1 26 0 DO SEEN I + C@ AND LOOP
  0<> ;

: CHECK ( addr len -- )
  2DUP TYPE ."  -> "
  PANGRAM? IF ." pangram" ELSE ." not a pangram" THEN CR ;

S" The quick brown fox jumps over the lazy dog" CHECK
S" Pack my box with five dozen liquor jugs" CHECK
S" Hello, Forth" CHECK
