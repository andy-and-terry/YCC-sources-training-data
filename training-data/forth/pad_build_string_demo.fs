\ PAD is scratch memory for building transient strings
: PAD-COPY ( addr u -- addr' u ) DUP >R PAD SWAP CMOVE PAD R> ;

S" scratch" PAD-COPY TYPE CR

\ build "<n>!" in PAD using pictured output
: EXCITED ( n -- addr u ) 0 <# [CHAR] ! HOLD #S #> ;
42 EXCITED TYPE CR
7 EXCITED TYPE CR
