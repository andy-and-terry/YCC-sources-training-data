\ Plus one on a digit array (most significant first)
create digits 1 c, 2 c, 9 c,
3 constant n
variable carry-out

: c+! ( n addr -- ) dup c@ rot + swap c! ;

: plus-one ( -- )
  0 carry-out !
  -1 n 1- do                      \ i runs n-1 down to 0
    digits i + c@ 9 < if
      1 digits i + c+!
      unloop exit
    then
    0 digits i + c!
  -1 +loop
  1 carry-out ! ;

: .digits ( -- )
  carry-out @ if ." 1" then
  n 0 do digits i + c@ 0 .r loop cr ;

plus-one .digits   \ 130
