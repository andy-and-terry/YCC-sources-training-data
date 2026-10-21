(* P(n) = 2*P(n-1) + P(n-2), with P(0) = 0 and P(1) = 1 *)
let rec pell n a b =
  if n = 0 then []
  else a :: pell (n - 1) b ((2 * b) + a)

let () =
  List.iteri (fun i p -> Printf.printf "P(%d) = %d\n" i p) (pell 15 0 1)
