\ Fibbinary numbers: no two adjacent 1 bits.
: fibbinary? ( n -- flag )  dup 2/ and 0= ;

: main  50 0 do i fibbinary? if i . then loop cr ;
main
bye
