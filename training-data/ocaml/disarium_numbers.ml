(* Disarium numbers: digits raised to their 1-based positions sum to n. *)
let rec pow b e = if e = 0 then 1 else b * pow b (e - 1)

let is_disarium n =
  let s = string_of_int n in
  let sum = ref 0 in
  String.iteri (fun i c -> sum := !sum + pow (Char.code c - 48) (i + 1)) s;
  !sum = n

let () =
  for n = 1 to 999 do
    if is_disarium n then Printf.printf "%d " n
  done;
  print_newline ()
