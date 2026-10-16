: BIT ( n -- mask ) 1 SWAP LSHIFT ;
: SET-BIT   ( x n -- x' ) BIT OR ;
: CLEAR-BIT ( x n -- x' ) BIT INVERT AND ;
: TOGGLE-BIT ( x n -- x' ) BIT XOR ;
: BIT-SET?  ( x n -- f ) BIT AND 0<> ;

0 3 SET-BIT . CR
8 0 SET-BIT . CR
9 3 CLEAR-BIT . CR
5 1 TOGGLE-BIT . CR
10 1 BIT-SET? . CR
10 2 BIT-SET? . CR
