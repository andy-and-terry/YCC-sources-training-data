\ /STRING, -TRAILING and string slicing on addr/len pairs
S" hello world" 2DUP TYPE CR
6 /STRING TYPE CR

S" hello world" 5 TYPE CR

S" padded   " -TRAILING DUP . TYPE CR

: FIRST-N ( addr u n -- addr n ) NIP ;
S" abcdef" 3 FIRST-N TYPE CR
