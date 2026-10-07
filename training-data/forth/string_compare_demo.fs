\ COMPARE and SEARCH on counted string pairs
: SAME? ( a1 u1 a2 u2 -- flag )  COMPARE 0= ;

S" apple" S" apple" SAME? . CR
S" apple" S" banana" COMPARE . CR
S" banana" S" apple" COMPARE . CR

S" the quick brown fox" S" quick" SEARCH
SWAP DROP . CR           \ remaining length after the match
S" hello" S" xyz" SEARCH NIP NIP . CR
