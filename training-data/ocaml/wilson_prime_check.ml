(* Wilson's theorem primality test. *)
let wilson n =
  n >= 2 && (let rec go i f = if i >= n then f else go (i + 1) (f * i mod n) in go 2 1) = n - 1

let () = List.iter (fun n -> if wilson n then Printf.printf "%d " n) (List.init 18 (fun i -> i + 2)); print_newline ()
