variable counter
0 counter !
: bump 1 counter +! ;
bump bump bump
counter @ .
