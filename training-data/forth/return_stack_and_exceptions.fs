: SWAP-VIA-R ( a b -- b a ) >R >R R> R> SWAP ;
: R-DEMO 10 >R 20 R@ + R> + . CR ;
: SAFE-DIV ( a b -- q ) DUP 0= IF DROP DROP -10 THROW THEN / ;
: TRY-DIV ( a b -- ) ['] SAFE-DIV CATCH ?DUP IF ." error " . 2DROP ELSE . THEN CR ;
R-DEMO
20 4 TRY-DIV
7 0 TRY-DIV
: MAYBE-THROW ( f -- ) IF 99 THROW THEN ." fine " ;
: GUARDED ( f -- ) ['] MAYBE-THROW CATCH DUP IF ." caught " . ELSE DROP THEN CR ;
0 GUARDED
-1 GUARDED
