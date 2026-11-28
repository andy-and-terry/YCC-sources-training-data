let rec digit_square_sum n = if n = 0 then 0 else (n mod 10) * (n mod 10) + digit_square_sum (n / 10)

let is_happy n =
  let rec go seen n =
    if n = 1 then true
    else if List.mem n seen then false
    else go (n :: seen) (digit_square_sum n)
  in
  go [] n

let () =
  List.init 40 (fun i -> i + 1)
  |> List.filter is_happy
  |> List.iter (Printf.printf "%d ");
  print_newline () (* 1 7 10 13 19 23 28 31 32 44 *)
