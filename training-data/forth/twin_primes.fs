variable pflag

: prime? ( n -- flag )
  dup 2 < if drop false exit then
  true pflag !
  dup 2 ?do
    i i * over > if leave then
    dup i mod 0= if false pflag ! leave then
  loop
  drop pflag @ ;

: twin-primes ( limit -- )
  3 ?do
    i prime? i 2 + prime? and if
      ." (" i . ." ," i 2 + . ." ) "
    then
  loop cr ;

79 twin-primes   \ pairs from (3,5) up to (71,73)
