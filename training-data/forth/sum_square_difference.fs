\ Square of the sum minus sum of squares for 1..10 (expect 2640)
: sum-to ( n -- s ) 0 swap 1+ 1 do i + loop ;
: squares-to ( n -- s ) 0 swap 1+ 1 do i i * + loop ;

: main 10 sum-to dup * 10 squares-to - . cr ;
main
bye
