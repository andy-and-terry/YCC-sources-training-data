: SHOW-RESULT ( n -- )
  CASE
    -1 OF ." less" ENDOF
     0 OF ." equal" ENDOF
     1 OF ." greater" ENDOF
  ENDCASE ;

: CMP ( addr1 len1 addr2 len2 -- )
  COMPARE SHOW-RESULT CR ;

S" apple" S" banana" CMP
S" pear" S" pear" CMP
S" zebra" S" ant" CMP
S" abc" S" abcd" CMP
