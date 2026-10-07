: CONTAINS? ( hay-addr hay-len needle-addr needle-len -- flag )
  SEARCH NIP NIP ;

S" the quick brown fox" S" quick" CONTAINS? . CR
S" the quick brown fox" S" slow" CONTAINS? . CR

: SHOW-REST ( hay-addr hay-len needle-addr needle-len -- )
  SEARCH IF
    ." found, rest: " TYPE
  ELSE
    ." not found" 2DROP
  THEN CR ;

S" hello world" S" o w" SHOW-REST
S" hello world" S" xyz" SHOW-REST

: STARTS-WITH? ( addr len prefix-addr prefix-len -- flag )
  ROT OVER < IF 2DROP DROP FALSE EXIT THEN
  TUCK COMPARE 0= ;

S" forth" S" for" STARTS-WITH? . CR
S" forth" S" fox" STARTS-WITH? . CR
S" hi" S" high" STARTS-WITH? . CR
