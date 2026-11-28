\ rail index of position i in a k-rail zigzag
: rail ( i k -- r )  dup 1- 2* >r swap r@ mod swap over swap < if r> drop else r> swap - then ;
: .rails ( n k -- )  swap 0 do i over rail . loop drop cr ;
15 3 .rails
bye
