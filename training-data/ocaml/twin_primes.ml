(* Twin primes: pairs (p, p+2) both prime; print the lesser of each pair. *)
let is_prime n =
  n >= 2 &&
  let rec go d = d * d > n || (n mod d <> 0 && go (d + 1)) in
  go 2

let () =
  List.init 98 (fun i -> i + 2)
  |> List.filter (fun p -> is_prime p && is_prime (p + 2))
  |> List.map string_of_int |> String.concat " " |> print_endline
