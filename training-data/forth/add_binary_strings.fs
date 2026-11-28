\ Add two binary strings by converting, adding and printing in base 2
: parse-bin ( addr len -- n )
  2 base !  0. 2swap >number 2drop  decimal ;

: .bin ( n -- ) 2 base ! . decimal ;

s" 1010" parse-bin  s" 1011" parse-bin  +  .bin cr   \ 10101
