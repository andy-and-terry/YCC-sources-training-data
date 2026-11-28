: row ( r -- )
  dup 7 swap - spaces
  dup 1+ 0 do dup i and i = if ." * " else ."   " then loop drop cr ;
: sierpinski 8 0 do i row loop ;
sierpinski
