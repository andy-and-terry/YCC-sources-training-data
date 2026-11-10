: cake ( n -- pieces ) dup dup dup * * swap 5 * + 6 + 6 / ;

: show-cake 10 0 do i cake . loop cr ;
show-cake   \ 1 2 4 8 15 26 42 64 93 130
