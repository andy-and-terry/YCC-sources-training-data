\ Sum of decimal digits of n
: digit-sum ( n -- s ) 0 swap begin dup while 10 /mod -rot + swap repeat drop ;

12345 digit-sum . cr   \ 15
999 digit-sum . cr     \ 27
