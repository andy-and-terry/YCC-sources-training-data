let rec column_title n =
  if n = 0 then ""
  else column_title ((n - 1) / 26) ^ String.make 1 (Char.chr (65 + ((n - 1) mod 26)))

let () = Printf.printf "%s %s\n" (column_title 28) (column_title 701) (* AB ZY *)
