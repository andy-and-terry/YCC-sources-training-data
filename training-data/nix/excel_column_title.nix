let
  letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
  columnTitle = n:
    if n == 0 then ""
    else
      let m = n - 1; q = m / 26; r = m - q * 26;
      in columnTitle q + builtins.substring r 1 letters;
in "${columnTitle 28} ${columnTitle 701}" # "AB ZY"
