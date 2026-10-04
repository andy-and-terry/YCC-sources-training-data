\ Comparing counted strings with COMPARE

: SAME? ( c-addr1 u1 c-addr2 u2 -- )
  COMPARE 0= IF ." equal" ELSE ." different" THEN CR ;

: ORDER ( c-addr1 u1 c-addr2 u2 -- )
  COMPARE CASE
    -1 OF ." first < second" ENDOF
     0 OF ." first = second" ENDOF
     1 OF ." first > second" ENDOF
  ENDCASE CR ;

S" hello" S" hello" SAME?
S" hello" S" Hello" SAME?
S" apple" S" banana" ORDER
S" pear" S" pear" ORDER
S" zebra" S" ant" ORDER
