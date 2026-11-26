(* Emirps below 200; expect 15. *)
let is_prime n =
  let rec go d = d * d > n || (n mod d <> 0 && go (d + 1)) in
  n > 1 && go 2

let rev n =
  let rec go n r = if n = 0 then r else go (n / 10) (r * 10 + n mod 10) in
  go n 0

let () =
  let c = ref 0 in
  for n = 2 to 199 do if rev n <> n && is_prime n && is_prime (rev n) then incr c done;
  Printf.printf "%d\n" !c
