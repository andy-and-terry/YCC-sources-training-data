: gcd ( a b -- g )
  begin dup while tuck mod repeat drop abs ;

: gcd-all ( n1 n2 n3 -- g ) gcd gcd ;

12 18 24 gcd-all . cr
7 13 7 gcd-all . cr
