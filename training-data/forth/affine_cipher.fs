\ affine map on one letter code: y = (a*x + b) mod 26
: affine-char ( c -- c' )  [char] A - 5 * 8 + 26 mod [char] A + ;
: affine ( addr len -- )  0 do dup i + c@ affine-char emit loop drop cr ;
s" AFFINE" affine
bye
