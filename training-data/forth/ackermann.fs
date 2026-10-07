\ Ackermann function via deep recursion
: ACK ( m n -- r )
  OVER 0= IF NIP 1+ EXIT THEN
  DUP 0= IF DROP 1- 1 RECURSE EXIT THEN
  OVER 1- ROT ROT 1- RECURSE RECURSE ;

2 3 ACK . CR
3 3 ACK . CR
