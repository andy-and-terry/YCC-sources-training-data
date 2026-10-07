(* Unlike Dijkstra, Bellman-Ford relaxes every edge |V| - 1 times, which
   still works correctly with negative edge weights as long as there is
   no negative-weight cycle reachable from the source. *)
let bellman_ford nodes edges source =
  let dist = Hashtbl.create 16 in
  List.iter (fun n -> Hashtbl.replace dist n max_int) nodes;
  Hashtbl.replace dist source 0;
  for _ = 1 to List.length nodes - 1 do
    List.iter
      (fun (from_node, to_node, weight) ->
        let from_dist = Hashtbl.find dist from_node in
        if from_dist <> max_int && from_dist + weight < Hashtbl.find dist to_node then
          Hashtbl.replace dist to_node (from_dist + weight))
      edges
  done;
  dist

let () =
  let nodes = [ "a"; "b"; "c"; "d" ] in
  let edges = [ ("a", "b", 4); ("a", "c", 5); ("b", "c", -3); ("c", "d", 2); ("b", "d", 6) ] in
  let dist = bellman_ford nodes edges "a" in
  List.iter (fun n -> Printf.printf "%s: %d\n" n (Hashtbl.find dist n)) nodes
