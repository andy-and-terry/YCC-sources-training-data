module SM = Map.Make (String)

let () =
  let m = SM.empty |> SM.add "a" 1 |> SM.add "b" 2 |> SM.add "c" 3 in
  let m = SM.update "b" (function Some v -> Some (v * 10) | None -> Some 0) m in
  let m = SM.update "z" (function Some v -> Some v | None -> Some 99) m in
  let m = SM.remove "a" m in
  SM.iter (fun k v -> Printf.printf "%s=%d\n" k v) m;
  Printf.printf "sum: %d\n" (SM.fold (fun _ v acc -> acc + v) m 0);
  Printf.printf "min: %s\n" (fst (SM.min_binding m));
  let big = SM.filter (fun _ v -> v > 10) m in
  Printf.printf "big keys: %s\n" (String.concat "," (List.map fst (SM.bindings big)))
