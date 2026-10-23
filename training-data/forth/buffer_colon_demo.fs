\ BUFFER: allocates an uninitialised named region
16 buffer: scratch

scratch 16 erase
65 scratch c!
66 scratch 1+ c!
67 scratch 2 + c!

scratch 3 type cr
scratch 16 + scratch - . cr

: fill-seq ( addr n -- ) 0 do i 48 + over i + c! loop drop ;
scratch 10 fill-seq
scratch 10 type cr
