\ ROT rotates the third item to the top; -ROT does the reverse
: SHOW ( -- ) .S CR ;

1 2 3 SHOW
ROT SHOW
-ROT SHOW
-ROT SHOW
DROP DROP DROP
