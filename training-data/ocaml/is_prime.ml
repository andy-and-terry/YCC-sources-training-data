let is_prime n =
  if n < 2 then false
  else
    let rec check i = i * i > n || (n mod i <> 0 && check (i + 1)) in
    check 2

let () =
  List.init 19 (fun i -> i + 2)
  |> List.filter is_prime
  |> List.map string_of_int
  |> String.concat " "
  |> print_endline
