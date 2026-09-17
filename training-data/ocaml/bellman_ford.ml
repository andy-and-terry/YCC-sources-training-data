type edge = { src : string; dst : string; weight : int }

let bellman_ford vertices edges source =
  let dist = Hashtbl.create 16 in
  List.iter (fun v -> Hashtbl.replace dist v max_int) vertices;
  Hashtbl.replace dist source 0;
  for _ = 1 to List.length vertices - 1 do
    List.iter
      (fun e ->
        let du = Hashtbl.find dist e.src in
        if du <> max_int && du + e.weight < Hashtbl.find dist e.dst then
          Hashtbl.replace dist e.dst (du + e.weight))
      edges
  done;
  let has_negative_cycle =
    List.exists
      (fun e ->
        let du = Hashtbl.find dist e.src in
        du <> max_int && du + e.weight < Hashtbl.find dist e.dst)
      edges
  in
  (dist, has_negative_cycle)

let () =
  let vertices = [ "a"; "b"; "c"; "d" ] in
  let edges =
    [
      { src = "a"; dst = "b"; weight = 4 };
      { src = "a"; dst = "c"; weight = 5 };
      { src = "b"; dst = "c"; weight = -3 };
      { src = "c"; dst = "d"; weight = 4 };
      { src = "b"; dst = "d"; weight = 6 };
    ]
  in
  let dist, has_cycle = bellman_ford vertices edges "a" in
  List.iter (fun v -> Printf.printf "%s: %d\n" v (Hashtbl.find dist v)) vertices;
  Printf.printf "negative cycle: %b\n" has_cycle
