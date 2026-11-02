: gcd ( a b -- g ) dup if tuck mod recurse else drop then ;
48 18 gcd .
