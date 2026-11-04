let digits = "0123456789abcdefghijklmnopqrstuvwxyz"

let to_base n base =
  if n = 0 then "0"
  else
    let rec go n acc = if n = 0 then acc else go (n / base) (String.make 1 digits.[n mod base] ^ acc) in
    go n ""

let () =
  List.iter (fun b -> Printf.printf "255 in base %d = %s\n" b (to_base 255 b)) [ 2; 8; 16; 36 ];
  Printf.printf "%d %d\n" (int_of_string "0xff") (int_of_string "0b1010")
