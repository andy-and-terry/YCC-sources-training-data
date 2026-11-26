(* Goldbach partitions of 100; expect 6. *)
let is_prime n =
  let rec go d = d * d > n || (n mod d <> 0 && go (d + 1)) in
  n > 1 && go 2

let () =
  let c = ref 0 in
  for p = 2 to 50 do
    if is_prime p && is_prime (100 - p) then begin
      Printf.printf "%d+%d\n" p (100 - p);
      incr c
    end
  done;
  Printf.printf "%d\n" !c
