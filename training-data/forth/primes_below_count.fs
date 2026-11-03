100 constant limit
create composite limit allot
composite limit erase

: count-primes ( -- n )
  0
  limit 2 do
    composite i + c@ 0= if
      1+
      limit i dup * ?do 1 composite i + c! j +loop
    then
  loop ;

count-primes . cr
