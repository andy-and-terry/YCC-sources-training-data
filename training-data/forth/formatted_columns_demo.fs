\ .R and U.R right-align numbers in a field
: ROW ( addr u n -- ) >R 2DUP TYPE NIP 12 SWAP - SPACES R> 6 .R CR ;

S" apples" 12 ROW
S" pears" 7 ROW
S" watermelons" 123 ROW

-5 6 .R CR
65535 8 U.R CR
0 3 .R CR
