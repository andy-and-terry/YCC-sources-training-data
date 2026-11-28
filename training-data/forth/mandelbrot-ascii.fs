\ fixed-point (scale 1000) Mandelbrot
: sq ( n -- n*n/1000 ) dup * 1000 / ;
: escape ( cr ci -- n )
  0 0 0 { cr ci zr zi n }
  begin
    n 30 < zr sq zi sq + 4000 < and
  while
    zr sq zi sq - cr +
    2 zr * zi * 1000 / 1000 / ci +
    to zi to zr
    n 1+ to n
  repeat n ;
: row ( y -- ) 53 0 do i 50 * -2000 + over escape 30 = if [char] # else [char] . then emit loop drop cr ;
: main 11 0 do i 200 * -1000 + row loop ;
main
