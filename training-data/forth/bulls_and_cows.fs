\ Bulls and Cows scoring for equal-length digit strings
create secret 1 c, 8 c, 0 c, 7 c,
create guess  7 c, 8 c, 1 c, 0 c,

: bulls ( -- n )
  0 4 0 do
    secret i + c@ guess i + c@ = if 1+ then
  loop ;

: common ( -- n )          \ digits shared regardless of position
  0 10 0 do
    0 4 0 do secret i + c@ j = if 1+ then loop
    0 4 0 do guess  i + c@ j = if 1+ then loop
    min +
  loop ;

: .score bulls dup . ." bull(s), " common swap - . ." cow(s)" cr ;
.score
