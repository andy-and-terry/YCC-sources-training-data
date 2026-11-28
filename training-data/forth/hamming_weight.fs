\ population count using n &= n-1
: popcount ( u -- n )  0 swap begin dup while dup 1- and swap 1+ swap repeat drop ;
%10110111 popcount . cr
255 popcount . cr
bye
