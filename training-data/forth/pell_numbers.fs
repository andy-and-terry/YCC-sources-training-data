\ Print the first 15 Pell numbers: P(n) = 2*P(n-1) + P(n-2)
: pell ( n -- )
  0 1 rot 0 do
    over . cr          \ print P(i)
    tuck 2* +          \ ( a b -- b 2b+a )
  loop 2drop ;

15 pell
bye
