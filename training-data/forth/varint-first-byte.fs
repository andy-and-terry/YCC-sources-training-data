: varint-first ( n -- byte ) 127 and 128 or ;
: varint-rest ( n -- n' ) 7 rshift ;

300 dup varint-first . varint-rest . cr
