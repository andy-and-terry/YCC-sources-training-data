type fenwick_tree = { tree : int array; n : int }

let make_fenwick_tree n = { tree = Array.make (n + 1) 0; n }

let update ft i delta =
  let idx = ref (i + 1) in
  while !idx <= ft.n do
    ft.tree.(!idx) <- ft.tree.(!idx) + delta;
    idx := !idx + (!idx land (- !idx))
  done

let prefix_sum ft i =
  let idx = ref (i + 1) in
  let sum = ref 0 in
  while !idx > 0 do
    sum := !sum + ft.tree.(!idx);
    idx := !idx - (!idx land (- !idx))
  done;
  !sum

let range_sum ft l r =
  prefix_sum ft r - (if l = 0 then 0 else prefix_sum ft (l - 1))

let () =
  let ft = make_fenwick_tree 8 in
  let values = [| 3; 2; -1; 6; 5; 4; -3; 3 |] in
  Array.iteri (fun i v -> update ft i v) values;
  Printf.printf "%d\n" (prefix_sum ft 5);
  Printf.printf "%d\n" (range_sum ft 2 6);
  update ft 0 4;
  Printf.printf "%d\n" (prefix_sum ft 5)
