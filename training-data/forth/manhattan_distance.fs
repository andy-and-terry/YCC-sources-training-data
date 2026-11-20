\ Manhattan distance of two 2-D points: ( x1 y1 x2 y2 -- d )
: manhattan  ( x1 y1 x2 y2 -- d )  rot - abs >r - abs r> + ;
1 2 4 6 manhattan . cr
