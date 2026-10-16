\ TUCK copies the top below the second; NIP drops the second
: DEMO-TUCK ( -- ) 1 2 TUCK .S CR 2DROP DROP ;
: DEMO-NIP  ( -- ) 1 2 NIP .S CR DROP ;

DEMO-TUCK
DEMO-NIP

\ useful idiom: keep the max and drop the other
: BIGGER ( a b -- max ) 2DUP < IF NIP ELSE DROP THEN ;
7 3 BIGGER . CR
2 9 BIGGER . CR
