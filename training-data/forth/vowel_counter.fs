: vowel? ( c -- flag )
  dup [char] a = over [char] e = or over [char] i = or
  over [char] o = or swap [char] u = or ;

: count-vowels ( addr u -- n )
  0 -rot 0 ?do
    dup i + c@ 32 or vowel? if swap 1+ swap then
  loop drop ;

s" Education is beautiful" count-vowels . cr
