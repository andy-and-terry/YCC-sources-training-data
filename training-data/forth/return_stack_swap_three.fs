\ rotate using the return stack
: my-rot ( a b c -- b c a ) >r swap r> swap ;
1 2 3 my-rot . . .
