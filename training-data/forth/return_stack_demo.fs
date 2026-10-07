\ Using the return stack for temporary storage
: SWAP-VIA-R ( a b -- b a )  >R >R R> R> SWAP ;
: SUM3 ( a b c -- sum )  >R + R> + ;
: PEEK-R ( n -- n n )  >R R@ R> ;

1 2 SWAP-VIA-R . . CR
1 2 3 SUM3 . CR
7 PEEK-R . . CR
