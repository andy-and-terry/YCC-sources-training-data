(* Breadth-first search over an adjacency-list graph, using the Stdlib
   Queue module to explore level by level and a Hashtbl to record the
   number of edges from the start node to each reachable node. *)
let bfs_distances graph start =
  let dist = Hashtbl.create 16 in
  let frontier = Queue.create () in
  Hashtbl.replace dist start 0;
  Queue.push start frontier;
  while not (Queue.is_empty frontier) do
    let node = Queue.pop frontier in
    let neighbors = try List.assoc node graph with Not_found -> [] in
    List.iter
      (fun neighbor ->
        if not (Hashtbl.mem dist neighbor) then (
          Hashtbl.replace dist neighbor (Hashtbl.find dist node + 1);
          Queue.push neighbor frontier))
      neighbors
  done;
  dist

let () =
  let graph =
    [ ("a", [ "b"; "c" ]); ("b", [ "d" ]); ("c", [ "d" ]); ("d", [ "e" ]); ("e", []) ]
  in
  let dist = bfs_distances graph "a" in
  List.iter (fun (node, _) -> Printf.printf "%s: %d\n" node (Hashtbl.find dist node)) graph
