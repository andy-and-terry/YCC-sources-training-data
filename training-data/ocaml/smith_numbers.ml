let digit_sum n =
  let rec go n acc = if n = 0 then acc else go (n / 10) (acc + n mod 10) in
  go n 0

let factors n =
  let rec go n p acc =
    if n = 1 then acc
    else if p * p > n then n :: acc
    else if n mod p = 0 then go (n / p) p (p :: acc)
    else go n (p + 1) acc
  in
  go n 2 []

let is_smith n =
  match factors n with
  | [] | [_] -> false
  | fs -> digit_sum n = List.fold_left (fun a f -> a + digit_sum f) 0 fs

let () =
  List.init 98 (fun i -> i + 2)
  |> List.filter is_smith
  |> List.map string_of_int
  |> String.concat " "
  |> print_endline
