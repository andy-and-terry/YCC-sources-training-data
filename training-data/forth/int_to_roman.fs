\ Integer (1..3999) to Roman numeral using a greedy table
create values 1000 , 900 , 500 , 400 , 100 , 90 , 50 , 40 , 10 , 9 , 5 , 4 , 1 ,

: sym ( i -- c-addr u )
  case
    0 of s" M" endof   1 of s" CM" endof  2 of s" D" endof   3 of s" CD" endof
    4 of s" C" endof   5 of s" XC" endof  6 of s" L" endof   7 of s" XL" endof
    8 of s" X" endof   9 of s" IX" endof 10 of s" V" endof  11 of s" IV" endof
    12 of s" I" endof
  endcase ;

: .roman ( n -- )
  13 0 do
    begin dup values i cells + @ >= while
      i sym type
      values i cells + @ -
    repeat
  loop drop ;

1994 .roman space 58 .roman cr
