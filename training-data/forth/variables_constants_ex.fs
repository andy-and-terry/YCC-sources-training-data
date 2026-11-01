variable counter
10 constant LIMIT
: bump  1 counter +! ;
: count-up  0 counter ! LIMIT 0 do bump loop counter @ . cr ;
count-up
