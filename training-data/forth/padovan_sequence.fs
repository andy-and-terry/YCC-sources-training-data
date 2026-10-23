\ Padovan numbers: P(n) = P(n-2) + P(n-3), P(0)=P(1)=P(2)=1
: PADOVAN ( n -- )
  >R 1 1 1 R>                 \ a b c n
  0 ?DO
    2 PICK .                  \ print a
    OVER 3 PICK +             \ a b c (a+b)
    >R ROT DROP R>            \ b c (a+b)
  LOOP
  2DROP DROP ;

15 PADOVAN CR
