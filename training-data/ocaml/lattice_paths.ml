(* Lattice paths with a DP array. *)
let lattice n =
  let row = Array.make (n + 1) 1 in
  for _ = 1 to n do
    for j = 1 to n do row.(j) <- row.(j) + row.(j - 1) done
  done;
  row.(n)

let () = Printf.printf "%d\n" (lattice 3)
