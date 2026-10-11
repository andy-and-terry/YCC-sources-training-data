CREATE SRC 5 C, 10 C, 20 C, 30 C, 40 C,
CREATE DST 5 ALLOT

: SHOW ( addr -- ) 5 0 DO DUP I + C@ . LOOP DROP CR ;

SRC DST 5 MOVE
DST SHOW

\ overlapping move shifts the data right by one
CREATE ARR 1 C, 2 C, 3 C, 4 C, 0 C,
ARR ARR 1+ 4 MOVE
ARR SHOW
