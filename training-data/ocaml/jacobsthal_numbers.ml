(* Jacobsthal numbers: J0=0, J1=1, Jn = J(n-1) + 2*J(n-2) *)
let jacobsthal count =
  let rec go n a b acc =
    if n = 0 then List.rev acc else go (n - 1) b (b + 2 * a) (a :: acc)
  in
  go count 0 1 []

let () = print_endline (String.concat " " (List.map string_of_int (jacobsthal 15)))
