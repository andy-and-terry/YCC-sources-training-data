(* Primorials up to 1e6, including 1; expect 8. *)
let is_prime n =
  let rec go d = d * d > n || (n mod d <> 0 && go (d + 1)) in
  n > 1 && go 2

let () =
  let rec go p acc count =
    if not (is_prime p) then go (p + 1) acc count
    else if acc * p > 1_000_000 then count
    else begin
      Printf.printf "%d " (acc * p);
      go (p + 1) (acc * p) (count + 1)
    end
  in
  print_string "1 ";
  Printf.printf "\n%d\n" (go 2 1 1)
