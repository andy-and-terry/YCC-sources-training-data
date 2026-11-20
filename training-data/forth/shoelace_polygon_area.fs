\ Doubled shoelace area of the rectangle (0,0) (4,0) (4,3) (0,3).
: cross ( x1 y1 x2 y2 -- n ) swap >r rot * swap r> * - ;
: twice-area  0 0 4 0 cross  4 0 4 3 cross +  4 3 0 3 cross +  0 3 0 0 cross + abs ;
twice-area 2/ . cr
