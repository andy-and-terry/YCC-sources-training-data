fun columnTitle 0 = ""
  | columnTitle n = columnTitle ((n - 1) div 26) ^ str (chr (65 + (n - 1) mod 26))

val _ = print (columnTitle 28 ^ " " ^ columnTitle 701 ^ "\n") (* AB ZY *)
