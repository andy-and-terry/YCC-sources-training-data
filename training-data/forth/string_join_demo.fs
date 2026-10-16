\ Append strings into a buffer with a separator
CREATE OUT 80 ALLOT
VARIABLE LEN

: RESET ( -- ) 0 LEN ! ;
: APPEND ( addr u -- ) DUP >R OUT LEN @ + SWAP CMOVE R> LEN +! ;
: SEP ( -- ) S" , " APPEND ;

RESET
S" red" APPEND SEP S" green" APPEND SEP S" blue" APPEND
OUT LEN @ TYPE CR
