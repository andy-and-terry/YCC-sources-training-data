\ ABORT" aborts when the flag on the stack is true, printing a message
: safe-div ( n d -- q )
  dup 0= abort" division by zero"
  / ;

: try-div ( n d -- )
  ['] safe-div catch
  if
    2drop ." caught abort" cr
  else
    . cr
  then ;

10 2 try-div
7 0 try-div
100 5 try-div

\ ABORT" inside a validation word
: check-age ( n -- n )
  dup 0 < abort" negative age"
  dup 150 > abort" age too large" ;

: show-age ( n -- )
  ['] check-age catch
  if drop ." invalid age" cr
  else ." ok: " . cr
  then ;

30 show-age
-5 show-age
200 show-age
