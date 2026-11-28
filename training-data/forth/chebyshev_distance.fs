\ Chebyshev distance between (1,2) and (4,6)
: chebyshev ( x1 y1 x2 y2 -- n )  rot - abs >r - abs r> max ;
1 2 4 6 chebyshev . cr
bye
