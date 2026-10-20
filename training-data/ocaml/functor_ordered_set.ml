module IntSet = Set.Make (Int)

let () =
  let s = IntSet.(empty |> add 3 |> add 1 |> add 3) in
  IntSet.iter (Printf.printf "%d ") s
