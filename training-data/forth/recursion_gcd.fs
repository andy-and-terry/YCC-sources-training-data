: gcd ( a b -- g ) ?dup if tuck mod recurse then ;
48 18 gcd . cr
