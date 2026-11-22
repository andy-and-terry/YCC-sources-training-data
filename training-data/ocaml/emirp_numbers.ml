(* Emirps: primes whose digit reversal is a different prime. *)
let is_prime n =
  n >= 2 &&
  let rec go d = d * d > n || (n mod d <> 0 && go (d + 1)) in
  go 2

let reverse n =
  let s = string_of_int n in
  let l = String.length s in
  int_of_string (String.init l (fun i -> s.[l - 1 - i]))

let () =
  List.init 198 (fun i -> i + 2)
  |> List.filter (fun n -> let r = reverse n in r <> n && is_prime n && is_prime r)
  |> List.map string_of_int |> String.concat " " |> print_endline
