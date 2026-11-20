(* Aliquot sum classification. *)
let aliquot n =
  let rec go d s = if d >= n then s else go (d + 1) (if n mod d = 0 then s + d else s) in
  go 1 0

let () =
  List.iter
    (fun n ->
      let a = aliquot n in
      Printf.printf "%d %d %s\n" n a (if a = n then "perfect" else if a > n then "abundant" else "deficient"))
    [ 6; 12; 15; 28 ]
