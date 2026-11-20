(* Goldbach pair returning an option. *)
let is_prime n =
  n > 1 && (let rec go d = d * d > n || (n mod d <> 0 && go (d + 1)) in go 2)

let goldbach n =
  let rec go p = if p > n / 2 then None else if is_prime p && is_prime (n - p) then Some (p, n - p) else go (p + 1) in
  go 2

let () = match goldbach 28 with Some (a, b) -> Printf.printf "%d + %d\n" a b | None -> ()
