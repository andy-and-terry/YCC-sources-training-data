\ Jaccard on bitmask sets: |A&B| / |A|B| as a pair of counts
: popcount ( u -- n )  0 swap begin dup while dup 1- and swap 1+ swap repeat drop ;
: jaccard ( a b -- inter union )  2dup and popcount >r or popcount r> swap ;
%11110 %111000 jaccard swap . . cr
bye
