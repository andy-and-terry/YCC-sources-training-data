\ Write a line to a file, then read it back (ANS file-access words)
CREATE linebuf 80 ALLOT
VARIABLE fid

S" demo_out.txt" W/O CREATE-FILE THROW fid !
S" hello from forth" fid @ WRITE-LINE THROW
fid @ CLOSE-FILE THROW

S" demo_out.txt" R/O OPEN-FILE THROW fid !
linebuf 80 fid @ READ-LINE THROW  ( len flag )
SWAP linebuf SWAP TYPE CR
DROP
fid @ CLOSE-FILE THROW

S" demo_out.txt" DELETE-FILE THROW
