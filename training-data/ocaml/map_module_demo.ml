module SMap = Map.Make (String)

let () =
  let m = SMap.empty |> SMap.add "one" 1 |> SMap.add "two" 2 |> SMap.add "three" 3 in
  SMap.iter (fun k v -> Printf.printf "%s -> %d\n" k v) m;
  Printf.printf "has two: %b\n" (SMap.mem "two" m);
  let m2 = SMap.map (fun v -> v * 10) m in
  Printf.printf "three*10 = %d\n" (SMap.find "three" m2);
  Printf.printf "size: %d\n" (SMap.cardinal (SMap.remove "one" m2))
