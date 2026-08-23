let dijkstra graph source =
  let dist = Hashtbl.create 16 in
  List.iter (fun (n, _) -> Hashtbl.replace dist n max_int) graph;
  Hashtbl.replace dist source 0;
  let visited = Hashtbl.create 16 in
  for _ = 1 to List.length graph do
    let best_node = ref None in
    let best_dist = ref max_int in
    Hashtbl.iter
      (fun node d ->
        if (not (Hashtbl.mem visited node)) && d < !best_dist then (
          best_node := Some node;
          best_dist := d))
      dist;
    match !best_node with
    | None -> ()
    | Some node ->
        Hashtbl.replace visited node true;
        (try
           List.iter
             (fun (neighbor, weight) ->
               let new_dist = !best_dist + weight in
               if new_dist < Hashtbl.find dist neighbor then Hashtbl.replace dist neighbor new_dist)
             (List.assoc node graph)
         with Not_found -> ())
  done;
  dist

let () =
  let graph =
    [ ("a", [ ("b", 1); ("c", 4) ]); ("b", [ ("c", 2); ("d", 5) ]); ("c", [ ("d", 1) ]); ("d", []) ]
  in
  let dist = dijkstra graph "a" in
  Hashtbl.iter (fun k v -> Printf.printf "%s: %d\n" k v) dist
