: TRIB ( n -- T(n) )
  DUP 0= IF EXIT THEN
  DUP 3 < IF DROP 1 EXIT THEN
  >R 0 1 1 R> 2 DO
    ROT 2 PICK + OVER +
  LOOP
  NIP NIP ;

: .TRIBS ( n -- )
  0 DO I TRIB . LOOP CR ;

10 .TRIBS
