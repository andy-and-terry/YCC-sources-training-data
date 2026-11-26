(* Squarefree numbers up to 100; expect 61. *)
let squarefree n =
  let rec go d = d * d > n || (n mod (d * d) <> 0 && go (d + 1)) in
  go 2

let () =
  let c = ref 0 in
  for n = 1 to 100 do if squarefree n then incr c done;
  Printf.printf "%d\n" !c
