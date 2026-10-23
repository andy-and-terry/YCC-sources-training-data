\ [IF] [ELSE] [THEN] select source text at compile time
1 constant debug?

debug? [IF]
  : trace ( n -- ) ." trace: " . cr ;
[ELSE]
  : trace ( n -- ) drop ;
[THEN]

42 trace

0 [IF]
  : version ( -- ) ." old version" cr ;
[ELSE]
  : version ( -- ) ." new version" cr ;
[THEN]
version

\ [DEFINED] and [UNDEFINED] test whether a word exists
[DEFINED] trace [IF]
  .( trace is defined) cr
[THEN]

[UNDEFINED] no-such-word-xyz [IF]
  : fallback ( -- ) ." fallback used" cr ;
  fallback
[THEN]

\ Nested conditional compilation
1 [IF]
  0 [IF] ." never" [ELSE] ." inner else" [THEN] cr
[THEN]
