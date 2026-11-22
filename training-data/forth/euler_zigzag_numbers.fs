\ Euler zigzag numbers via the Seidel-Entringer boustrophedon.
16 cells constant rowsize
create row  rowsize allot
create nxt  rowsize allot
variable len

: zigzag-step ( -- )
  0 nxt !
  len @ 1+ 1 do
    nxt i 1- cells + @                  \ next[j-1]
    row len @ i - cells + @ +           \ + row[len-j]
    nxt i cells + !
  loop
  1 len +!
  len @ 0 do nxt i cells + @ row i cells + ! loop ;

: main
  1 row ! 1 len !
  1 .
  9 0 do zigzag-step row len @ 1- cells + @ . loop cr ;
main
bye
