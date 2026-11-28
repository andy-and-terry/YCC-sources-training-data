\ Spreadsheet column number to letters (28 -> AB, 701 -> ZY)
: column-title ( n -- )
  dup 0> if
    1-  dup 26 /  recurse       \ print the higher-order letters first
    26 mod [char] A + emit
  else drop then ;

28 column-title space 701 column-title cr   \ AB ZY
