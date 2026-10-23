\ Floating point variables and constants
fvariable total
0e total f!

: add-to-total ( f: x -- ) total f@ f+ total f! ;

1.5e add-to-total
2.25e add-to-total
0.25e add-to-total
total f@ f. cr

3.14159e fconstant my-pi
my-pi 2e f* f. cr
9e fsqrt f. cr
10 s>f 4 s>f f/ f. cr
2.7e f>s . cr
