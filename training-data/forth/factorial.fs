: FACTORIAL ( n -- n! )
  DUP 1 > IF
    DUP 1- RECURSE *
  ELSE
    DROP 1
  THEN ;

5 FACTORIAL . CR
