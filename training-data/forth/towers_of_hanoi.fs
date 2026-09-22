: HANOI ( from to via n -- )
  DUP 0> IF
    3 PICK 3 PICK 3 PICK 3 PICK
    >R SWAP R> 1-
    RECURSE
    DUP ." Move disk " .
    3 PICK ." from " .
    2 PICK ." to " . CR
    >R SWAP ROT R> 1-
    RECURSE
  ELSE
    DROP DROP DROP DROP
  THEN ;

1 3 2 4 HANOI
CR
