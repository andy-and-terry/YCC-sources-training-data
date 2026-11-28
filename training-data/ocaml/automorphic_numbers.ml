let ends_with s suffix =
  let ls = String.length s and lx = String.length suffix in
  ls >= lx && String.sub s (ls - lx) lx = suffix

let is_automorphic n = ends_with (string_of_int (n * n)) (string_of_int n)

let () =
  for n = 0 to 999 do
    if is_automorphic n then Printf.printf "%d " n
  done;
  print_newline () (* 0 1 5 6 25 76 376 625 *)
