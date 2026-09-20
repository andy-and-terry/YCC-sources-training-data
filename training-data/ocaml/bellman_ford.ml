let inf = max_int / 2

(* Unlike Dijkstra, Bellman-Ford tolerates negative edge weights and can
   also detect a negative-weight cycle reachable from the source. *)
let bellman_ford edges vertex_count source =
  let dist = Array.make vertex_count inf in
  dist.(source) <- 0;
  for _ = 1 to vertex_count - 1 do
    List.iter
      (fun (u, v, w) -> if dist.(u) <> inf && dist.(u) + w < dist.(v) then dist.(v) <- dist.(u) + w)
      edges
  done;
  let has_negative_cycle =
    List.exists (fun (u, v, w) -> dist.(u) <> inf && dist.(u) + w < dist.(v)) edges
  in
  (dist, has_negative_cycle)

let () =
  let edges =
    [ (0, 1, -1); (0, 2, 4); (1, 2, 3); (1, 3, 2); (1, 4, 2); (3, 2, 5); (3, 1, 1); (4, 3, -3) ]
  in
  let dist, has_negative_cycle = bellman_ford edges 5 0 in
  Array.iter (fun d -> Printf.printf "%d " d) dist;
  print_newline ();
  Printf.printf "negative cycle: %b\n" has_negative_cycle
