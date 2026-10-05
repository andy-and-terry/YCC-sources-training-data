: SHOW-COMPARE ( c-addr1 u1 c-addr2 u2 -- )
  COMPARE
  DUP 0< IF DROP ." less" EXIT THEN
  0> IF ." greater" ELSE ." equal" THEN ;

S" apple" S" banana" SHOW-COMPARE CR
S" pear" S" apple" SHOW-COMPARE CR
S" same" S" same" SHOW-COMPARE CR

S" abc" S" abc" COMPARE 0= . CR

: FIND-WORD ( c-addr u c-addr2 u2 -- )
  SEARCH IF TYPE ELSE 2DROP ." not found" THEN CR ;

S" hello world" S" wor" FIND-WORD
S" hello world" S" xyz" FIND-WORD
