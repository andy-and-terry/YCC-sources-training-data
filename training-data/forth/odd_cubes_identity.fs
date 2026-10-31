: CUBE-FROM-ODDS ( n -- sum )
  >R  R@ DUP * R@ - 1+          \ start
  0                              \ start sum
  R> 0 ?DO  OVER I 2 * + +  LOOP
  NIP ;

: MAIN  6 1 DO  I . I CUBE-FROM-ODDS . I CUBE-FROM-ODDS I DUP DUP * * = . CR  LOOP ;
MAIN
