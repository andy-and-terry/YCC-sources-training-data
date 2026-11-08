create xs 10 , 12 , 15 , 15 , 20 ,

: delta-print ( -- )
  xs @ .
  4 0 do
    xs i 1+ cells + @  xs i cells + @ -  .
  loop cr ;

delta-print
