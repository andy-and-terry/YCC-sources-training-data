\ Centered square numbers: n^2 + (n+1)^2.
: centered ( n -- m )  dup dup * swap 1+ dup * + ;

: main  10 0 do i centered . loop cr ;
main
bye
