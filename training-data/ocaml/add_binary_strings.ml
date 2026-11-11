let add_binary a b =
  let buf = Buffer.create 16 in
  let rec go i j carry acc =
    if i < 0 && j < 0 && carry = 0 then acc
    else
      let d s k = if k >= 0 then Char.code s.[k] - 48 else 0 in
      let sum = d a i + d b j + carry in
      go (i - 1) (j - 1) (sum / 2) (string_of_int (sum mod 2) ^ acc)
  in
  Buffer.add_string buf (go (String.length a - 1) (String.length b - 1) 0 "");
  Buffer.contents buf

let () = print_endline (add_binary "1010" "1011") (* 10101 *)
