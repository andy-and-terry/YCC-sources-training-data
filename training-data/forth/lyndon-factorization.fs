\ Duval's algorithm on "banana"
s" banana" 2constant txt
: c@t ( i -- c ) txt drop + c@ ;
: duval
  0 { i }
  begin i 6 < while
    i 1+ i { j k }
    begin j 6 < k c@t j c@t <= and while
      k c@t j c@t < if i to k else k 1+ to k then
      j 1+ to j
    repeat
    begin i k <= while
      txt drop i + j k - type space
      j k - i + to i
    repeat
  repeat cr ;
duval
