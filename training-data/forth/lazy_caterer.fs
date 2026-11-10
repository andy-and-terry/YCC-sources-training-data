: pieces ( cuts -- n ) dup dup * + 2 + 2/ ;

: show-pieces 10 0 do i pieces . loop cr ;
show-pieces   \ 1 2 4 7 11 16 22 29 37 46
