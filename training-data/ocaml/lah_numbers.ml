(* Unsigned Lah numbers L(n, k) = C(n-1, k-1) * n! / k!  (row n = 5). *)
let rec fact n = if n <= 1 then 1 else n * fact (n - 1)
let comb n k = fact n / (fact k * fact (n - k))

let () =
  let n = 5 in
  List.init n (fun i -> let k = i + 1 in string_of_int (comb (n - 1) (k - 1) * fact n / fact k))
  |> String.concat " " |> print_endline
