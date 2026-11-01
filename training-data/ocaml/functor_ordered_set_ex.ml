module IntSet = Set.Make (Int)
module StrMap = Map.Make (String)

let () =
  let s = IntSet.(empty |> add 3 |> add 1 |> add 3) in
  IntSet.iter (Printf.printf "%d ") s;
  print_newline ();
  let m = StrMap.(empty |> add "a" 1 |> add "b" 2) in
  StrMap.iter (fun k v -> Printf.printf "%s=%d\n" k v) m
