: ACK ( m n -- r )
  OVER 0= IF NIP 1+ EXIT THEN
  DUP 0= IF DROP 1- 1 RECURSE EXIT THEN
  OVER 1- ROT ROT 1-      \ m-1 m n-1
  RECURSE                 \ m-1 ack(m,n-1)
  RECURSE ;

2 3 ACK . CR
3 3 ACK . CR
0 5 ACK . CR
