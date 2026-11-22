(* Sophie Germain primes: p prime and 2p + 1 prime. *)
let is_prime n =
  n >= 2 &&
  let rec go d = d * d > n || (n mod d <> 0 && go (d + 1)) in
  go 2

let () =
  List.init 98 (fun i -> i + 2)
  |> List.filter (fun p -> is_prime p && is_prime (2 * p + 1))
  |> List.map string_of_int |> String.concat " " |> print_endline
